-- Sample data for AWS Aurora.
-- Same examples as sample-data.md; use this for seeding and automated tests.

CREATE TABLE Equipment (
  equipmentId VARCHAR(32) PRIMARY KEY,
  itemName VARCHAR(64) NOT NULL,
  total INT NOT NULL
);

CREATE TABLE Ticket (
  ticketId VARCHAR(32) PRIMARY KEY,
  createdAt VARCHAR(30) NOT NULL,
  name VARCHAR(64) NOT NULL,
  quantity INT NOT NULL,
  equipmentId VARCHAR(32) NOT NULL,
  FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
);


-- 1. Browse equipment

INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);

INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');


-- 2. Successful create ticket
-- Alex borrows 1 Gloves. Total available goes from 12 to 11.
-- Other rows are unchanged from scenario 1.

INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 11),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);

INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('m3n8kp2w', '2026-08-05T10:00:00.000Z', 'Alex', 1, 'g4n8kp2w'),
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');


-- 3. Open a ticket to return
-- Get ticket k7m2xq9p by id. Tables are otherwise the same as scenario 1.

INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2);

INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');


-- 4. View results (tickets)
-- Same table contents as scenario 1; tickets newest first.

INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 2),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);

INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b'),
  ('k7m2xq9p', '2026-07-28T12:15:00.000Z', 'Lucas', 2, 'k7m1xq9p');


-- 5. Return item
-- Lucas returns 2 Bats. Ticket k7m2xq9p is deleted.
-- Bats available increments from 8 to 10.

INSERT INTO Equipment (equipmentId, itemName, total) VALUES
  ('k7m1xq9p', 'Bats', 10),
  ('g4n8kp2w', 'Gloves', 12),
  ('h2p6rt3c', 'Helmets', 10),
  ('b9q4vs1b', 'Baseballs', 24),
  ('c2t7yh5d', 'Catcher''s gear', 3),
  ('a8w3mn4f', 'Bases', 4);

INSERT INTO Ticket (ticketId, createdAt, name, quantity, equipmentId) VALUES
  ('n4p8wd2c', '2026-08-03T14:30:00.000Z', 'Maya', 1, 'h2p6rt3c'),
  ('t9r3ab6k', '2026-07-30T16:00:00.000Z', 'Jordan', 3, 'b9q4vs1b');
