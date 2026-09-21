# Voting Specs

This repo contains the specification for a simple sports equipment borrowing app that allows users to view all equipment, create a ticket, return item, and view all tickets.

* [Use cases](use-cases.md) - Describes what users will experience with the running system.  These cases form the basis for acceptance tests.
* [API](openapi.yaml) - Describes the HTTP contract betwen the web brower (client) and the backend (server).
* [Data model](db.md) - Describes how data is stored in AWS Aurora tables.
* [Sample data](sample-data.md) - Example data show in AWS Aurora format.  These examples are codified in a machine-readable [`sample-data.sql`](sample-data.sql) format for seeding a database and/or use with tests.
* [UI mocks](ui/) This folder contains static HTML/CSS pages for the various views of the system.

