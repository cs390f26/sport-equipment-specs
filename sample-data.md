# Sample data

Shared fixture for UI mockups and automated tests. Rows use the same shape as the Aurora tables in [`db.md`](db.md): `Equipment` (`equipmentId`, `itemName`, `total`) and `Ticket` (`ticketId`, `createdAt`, `name`, `quantity`, `equipmentId`). Ticket `equipmentId` values are foreign keys into `Equipment`.

**Machine-readable copy:** [`sample-data.sql`](sample-data.sql) (same examples; use this for seeding and automated tests — do not parse this markdown).

All ticket `createdAt` values are distinct. Ticket lists below are newest first (`ORDER BY createdAt DESC`).

This set covers five use-case scenarios from [`uses-cases.md`](uses-cases.md): a locker list with data, a successful ticket create, an existing ticket opened to return, a tickets page with multiple open borrows, and a returned item.

---


## 1. Browse equipment

Someone opens the locker. Each equipment row is a button showing the item and remaining quantity. Three open tickets already exist, so Bats, Helmets, and Baseballs are below full stock.

### Equipment

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);
```

### Ticket

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');
```


## 2. Successful create ticket

Alex borrows 1 Gloves. The system inserts a ticket and decrements glove available from 12 to 11. The new ticket is first when listing newest first. Other rows are unchanged from scenario 1.

### Equipment

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 11),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);
```

### Ticket

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('m3n8kp2w', '2026-08-05T10:00:00.000Z', 'Alex', 1, 'g4n8kp2w'),
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');
```


## 3. Open a ticket to return

Get ticket `k7m2xq9p` by id. The borrower, linked item, quantity, and return action all come from this ticket plus its `equipmentId` row. Tables are otherwise the same as scenario 1.

### Equipment

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2);
```

### Ticket

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');
```


## 4. View results (tickets)

List all tickets. Each row shows the borrower name, item, quantity, and a return action. Item names come from `Equipment` via `equipmentId`. Same table contents as scenario 1; tickets newest first.

### Equipment

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);
```

### Ticket

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');
```


## 5. Return item

Lucas returns 2 Bats. Ticket `k7m2xq9p` is deleted and is no longer listed. Bats available increments from 8 to 10.

### Equipment

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 10),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);
```

### Ticket

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b');
```
