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

* The Customer entity will include the Name, Contact details and Address (including zip code, street and flat number) attributes.

* The Restaurant entity will include the Name, Location, Menu (Name, ingredients, calories, nutrients) and Feedback attributes.

* The Order entity will include Order number, details, Price breakup, Order timestamp and
Order status.

* The Delivery Partner entity will include the Partner name, Location, Status and Rating
attributes.

* Coupons entity will include the coupon name, code, discount percentage, expiry date and terms attributes.

* Rating entity will include rating, order id for restaurants and delivery partners.

# Appetit Entity Relationship Diagram
![ERD Diagram](/Diagrams/appetit_ERD.jpg)