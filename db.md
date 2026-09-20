# Data model

Equipment/ticket data for this system is stored in **AWS Aurora** (two tables).


## Access patterns

- Create a ticket
- Get a ticket by id
- List all tickets
- Increment/Decrement equipment quantities available
- Delete ticket


## Table 1

| Setting | Value |
|---------|--------|
| Table name | `Equipment` |
| Partition key | `equipmentId` (String) — unique identifier for the equipment |
| Sort key | none |


## Item shape

| Attribute | Type | Notes |
|-----------|------|--------|
| `equipmentId` | S | Partition key; unique |
| `itemName` | S | name of item |
| `total` | Int | amount of each item |


Example item:

```sql
INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2);
```

## Table 2

| Setting | Value |
|---------|--------|
| Table name | `Ticket` |
| Partition key | `ticketId` (String) — unique identifier for the ticket |
| Sort key | none |

Listing tickets uses a table (`ORDER BY createdAt DESC`); the application sorts results in memory when a particular order is required (for example, newest first).


## Item shape

| Attribute | Type | Notes |
|-----------|------|--------|
| `ticketId` | S | Partition key; unique |
| `createdAt` | S | UTC timestamp when the ticket was created (used when sorting newest first after a Scan) |
| `name` | S | name of user who created ticket  |
| `quantity` | Int | amount of item borrowed  |
| `equipmentId` | S | Foreign key to manipulate equipment table  |


Example item:

```sql
INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');
```
