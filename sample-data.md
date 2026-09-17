# Sample data

Shared fixture for UI mockups and automated tests. Items use the same shape as the Aurora data model in [`db.md`](db.md): `Equipment` (`equipmentId`, `itemName`, `quantity`) and `Ticket` (`ticketId`, `createdAt`, `name`, `quantity`, `equipmentId`). Ticket `equipmentId` values are foreign keys into `Equipment`.

**Machine-readable copy:** [`sample-data.json`](sample-data.json) (same examples; use this for seeding and automated tests — do not parse this markdown).

All ticket `createdAt` values are distinct. Ticket lists below are newest first (Scan, then sort in memory).

This set covers five use-case scenarios from [`uses-cases.md`](uses-cases.md): a locker list with data, a successful ticket create, an existing ticket opened to return, a tickets page with multiple open borrows, and a returned item.

---


## 1. Browse equipment

Someone opens the locker. Each equipment row is a button showing the item and remaining quantity. Three open tickets already exist, so Bats, Helmets, and Baseballs are below full stock.

### Equipment

```json
[
  { "equipmentId": "k7m1xq9p", "itemName": "Bats", "quantity": 8 },
  { "equipmentId": "g4n8kp2w", "itemName": "Gloves", "quantity": 12 },
  { "equipmentId": "h2p6rt3c", "itemName": "Helmets", "quantity": 10 },
  { "equipmentId": "b9q4vs1b", "itemName": "Baseballs", "quantity": 24 },
  { "equipmentId": "c2t7yh5d", "itemName": "Catcher's gear", "quantity": 3 },
  { "equipmentId": "a8w3mn4f", "itemName": "Bases", "quantity": 4 }
]
```

### Ticket

```json
[
  {
    "ticketId": "n4p8wd2c",
    "createdAt": "2026-08-03T14:30:00.000Z",
    "name": "Maya",
    "quantity": 1,
    "equipmentId": "h2p6rt3c"
  },
  {
    "ticketId": "t9r3ab6k",
    "createdAt": "2026-07-30T16:00:00.000Z",
    "name": "Jordan",
    "quantity": 3,
    "equipmentId": "b9q4vs1b"
  },
  {
    "ticketId": "k7m2xq9p",
    "createdAt": "2026-07-28T12:15:00.000Z",
    "name": "Lucas",
    "quantity": 2,
    "equipmentId": "k7m1xq9p"
  }
]
```


## 2. Successful create ticket

Alex borrows 1 Gloves. The system inserts a ticket and decrements `Gloves.quantity` from 12 to 11. The new ticket is first when listing newest first. Other rows are unchanged from scenario 1.

### Equipment

```json
[
  { "equipmentId": "k7m1xq9p", "itemName": "Bats", "quantity": 8 },
  { "equipmentId": "g4n8kp2w", "itemName": "Gloves", "quantity": 11 },
  { "equipmentId": "h2p6rt3c", "itemName": "Helmets", "quantity": 10 },
  { "equipmentId": "b9q4vs1b", "itemName": "Baseballs", "quantity": 24 },
  { "equipmentId": "c2t7yh5d", "itemName": "Catcher's gear", "quantity": 3 },
  { "equipmentId": "a8w3mn4f", "itemName": "Bases", "quantity": 4 }
]
```

### Ticket

```json
[
  {
    "ticketId": "m3n8kp2w",
    "createdAt": "2026-08-05T10:00:00.000Z",
    "name": "Alex",
    "quantity": 1,
    "equipmentId": "g4n8kp2w"
  },
  {
    "ticketId": "n4p8wd2c",
    "createdAt": "2026-08-03T14:30:00.000Z",
    "name": "Maya",
    "quantity": 1,
    "equipmentId": "h2p6rt3c"
  },
  {
    "ticketId": "t9r3ab6k",
    "createdAt": "2026-07-30T16:00:00.000Z",
    "name": "Jordan",
    "quantity": 3,
    "equipmentId": "b9q4vs1b"
  },
  {
    "ticketId": "k7m2xq9p",
    "createdAt": "2026-07-28T12:15:00.000Z",
    "name": "Lucas",
    "quantity": 2,
    "equipmentId": "k7m1xq9p"
  }
]
```


## 3. Open a ticket to return

Get ticket `k7m2xq9p` by id. The borrower, linked item, quantity, and return action all come from this ticket plus its `equipmentId` row. Tables are otherwise the same as scenario 1.

### Equipment

```json
[
  { "equipmentId": "k7m1xq9p", "itemName": "Bats", "quantity": 8 }
]
```

### Ticket

```json
[
  {
    "ticketId": "k7m2xq9p",
    "createdAt": "2026-07-28T12:15:00.000Z",
    "name": "Lucas",
    "quantity": 2,
    "equipmentId": "k7m1xq9p"
  }
]
```


## 4. View results (tickets)

List all tickets (Scan). Each row shows the borrower name, item, quantity, and a return action. Item names come from `Equipment` via `equipmentId`. Same table contents as scenario 1; tickets newest first.

### Equipment

```json
[
  { "equipmentId": "k7m1xq9p", "itemName": "Bats", "quantity": 8 },
  { "equipmentId": "g4n8kp2w", "itemName": "Gloves", "quantity": 12 },
  { "equipmentId": "h2p6rt3c", "itemName": "Helmets", "quantity": 10 },
  { "equipmentId": "b9q4vs1b", "itemName": "Baseballs", "quantity": 24 },
  { "equipmentId": "c2t7yh5d", "itemName": "Catcher's gear", "quantity": 3 },
  { "equipmentId": "a8w3mn4f", "itemName": "Bases", "quantity": 4 }
]
```

### Ticket

```json
[
  {
    "ticketId": "n4p8wd2c",
    "createdAt": "2026-08-03T14:30:00.000Z",
    "name": "Maya",
    "quantity": 1,
    "equipmentId": "h2p6rt3c"
  },
  {
    "ticketId": "t9r3ab6k",
    "createdAt": "2026-07-30T16:00:00.000Z",
    "name": "Jordan",
    "quantity": 3,
    "equipmentId": "b9q4vs1b"
  },
  {
    "ticketId": "k7m2xq9p",
    "createdAt": "2026-07-28T12:15:00.000Z",
    "name": "Lucas",
    "quantity": 2,
    "equipmentId": "k7m1xq9p"
  }
]
```


## 5. Return item

Lucas returns 2 Bats. Ticket `k7m2xq9p` is deleted and is no longer listed. `Bats.quantity` increments from 8 to 10.

### Equipment

```json
[
  { "equipmentId": "k7m1xq9p", "itemName": "Bats", "quantity": 10 },
  { "equipmentId": "g4n8kp2w", "itemName": "Gloves", "quantity": 12 },
  { "equipmentId": "h2p6rt3c", "itemName": "Helmets", "quantity": 10 },
  { "equipmentId": "b9q4vs1b", "itemName": "Baseballs", "quantity": 24 },
  { "equipmentId": "c2t7yh5d", "itemName": "Catcher's gear", "quantity": 3 },
  { "equipmentId": "a8w3mn4f", "itemName": "Bases", "quantity": 4 }
]
```

### Ticket

```json
[
  {
    "ticketId": "n4p8wd2c",
    "createdAt": "2026-08-03T14:30:00.000Z",
    "name": "Maya",
    "quantity": 1,
    "equipmentId": "h2p6rt3c"
  },
  {
    "ticketId": "t9r3ab6k",
    "createdAt": "2026-07-30T16:00:00.000Z",
    "name": "Jordan",
    "quantity": 3,
    "equipmentId": "b9q4vs1b"
  }
]
```
