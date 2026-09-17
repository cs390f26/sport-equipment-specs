# Use cases

This app lets someone view baseball equipment for a little league organization. A user can borrow equipment and return it when finished.

---


## Browse equipment

Someone opens the application to see what equipment is available.

They see a list of all equipment. Each entry shows the item and the quantity of each. 

The items are buttons that the user can press to create a ticket to borrow the equipment.

### Scenarios

- **List with data** — Each button shows the equipment item and quantity of each item.

---


## Create a ticket

Someone wants to borrow equipment.

They provide:

- their name
- quantity of the item they wish to borrow
- you can borrow only that particular item in ticket

The system creates the ticket and updates the quantity available on the equipment page. The new ticket starts with a quantity of one on every time, but can be incremented.

If they cancel, they return to the equipment list without creating anything.

User must enter name and valid quantity. If invalid quantity is entered, the ticket isn't created (error message shown).

### Scenarios

- **Successful create** — Valid ticket. The system creates the ticket and routes to ticket page, which shows all tickets currently there. Can click on ticket to return item
- **Cancel** — If they cancel, they return to the equipment list without creating anything.
- **Invalid input** — User must enter name and valid quantity. If invalid quantity is entered, the ticket isn't created (error message shown) and user can retry.


---


## Open a ticket to return

Someone picks a ticket from the list (or opens it directly) to return it.

If returned, the equipment quantity is incremented in the equipment page.

If the ticket does not exist, they are told it was not found.


### Scenarios

- **Ticket page** — For an existing ticket, they see the item and its quantity and the ability to return it
- **Unknown ticket** — The ticket id does not exist. They are told the ticket was not found.


---

## View results

View all tickets, with the names, quantities of item, and ability to return it.

If ticket item is returned, ticket is deleted and not shown on page anymore.


### Scenarios

- **Tickets page** — For an existing ticket, they see the item, quantity, and ability to return it.
- **Return item** — If ticket item is returned, ticket is deleted and not shown on page anymore.
- **Unknown ticket** — The ticket id does not exist. They are told the ticket was not found.

