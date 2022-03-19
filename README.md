## Database for Appétit
A database schema for a food-delivery startup

# Introduction:
**Appétit** is a food delivery app that was created to support local restaurants during the pandemic. This startup offered the restaurants/merchants lucrative deals with minimum subscription charges of only $99 per month that was less when compared to their competitors like Grubhub, UberEats, DoorDash, etc.

Appétit will also help the customers with a comprehensive and easy-to-use platform to find the right place and enjoy their food. Customers would be provided with either delivery or pick-up options as well.

# Process:
Appétit database will help their prospective customers to sign up and place their orders. They will be provided with a wide variety of menus to choose from, from local restaurants. They can customize their orders with respect to the ingredients, delivery timings, and mode of delivery i.e., pickup or home delivery. Once the order is placed, the restaurant will receive the order and start preparing it and also assign a delivery partner if the mode of delivery is selected to be home delivery. The delivery partner will be notified regarding the ETA of the preparation of the food item. Post preparation of the food item or order, the delivery partner can pick it up and go ahead with the food delivery. Once the order is delivered, the customer is provided with a feedback notification regarding the food and delivery service. If the mode of delivery is selected as pick-up, then the customer goes to the restaurant and picks up the order.
Once the order is picked up from the restaurant the customer will be provided with a feedback notification regarding the food and delivery service.

# Database:
The Appétit Database will store the customer, restaurant, and delivery partner details.

* The **Customer** entity will include the Name, Contact details and Address (including zip code, street and flat number) attributes.

* The **Restaurant** entity will include the Name, Location, Menu (Name, ingredients, calories, nutrients) and Feedback attributes.

* The **Order** entity will include Order number, details, Price breakup, Order timestamp and
Order status.

* The **Delivery Partner** entity will include the Partner name, Location, Status and Rating
attributes.

* **Coupons** entity will include the coupon name, code, discount percentage, expiry date and terms attributes.

* **Rating** entity will include rating, order id for restaurants and delivery partners.

# Appetit Entity Relationship Diagram
![ERD Diagram](/Diagrams/appetit_ERD.jpg)

# Assumptions:
1.	The Appetit app only works in Buffalo city.
2.	A Restaurant is assumed to only have a single menu (list of items).
3.	A customer can place only one order with a specific restaurant at a time.
4.	You can only give one rating for a restaurant and delivery partner for a specific order.
5.	You can apply utmost one coupon for a specific order.
6.	Discounts are item/restaurant specific and are different from coupons.
7.	Customers who have opted for a subscription are associated with a specific coupon code (“VIP” for instance) that gives them an offer on all orders.
8.	A customer can have only one coupon at one point in time.
9.	Only a single payment can be made for a specific order.

# Business Rules:
1.	Customers place zero or more orders but each Order corresponds to only one customer.
2.	Each Order belongs to exactly one restaurant but a Restaurant can have zero or more orders.
3.	A Restaurant will have at least one item but an Item will belong to only one restaurant.
4.	An Item in a specific Restaurant can have zero or more Orders (Order_SubTotal) but each Item in an Order will have exactly one restaurant-specific Item.
5.	An Order contains at least one item but each Item in Order Subtotal will have exactly one Order.
6.	Each Order will have exactly one Payment, one Delivery Rating and one Restaurant Rating and vice-versa.
7.	An Order can have utmost one coupon applied but each Coupon can be applied on zero or more orders.
8.	An Order will have only one delivery partner but each Delivery Partner can deliver zero or more orders.
9.	A Delivery Partner and Restaurant can have zero or more ratings but each Delivery Rating or Restaurant Rating corresponds to a single delivery partner or restaurant.


# Database Relational Schema:
![Relational Schema 1](/Diagrams/Database_diagram_1.png)

![Relational Schema 2](/Diagrams/Database_diagram_2.png)

![Relational Schema 3](/Diagrams/Database_diagram_3.png)

# Database Diagram: 

![Database Diagram](/Diagrams/Database_diagram_4.jpg)