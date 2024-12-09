# **Homework Assignment: Simple Shopping Cart with Phoenix and GenServers**

## **Objective**
In this example, you will create a small shopping cart app, where the user can add/remove items while ordering products
online. The products are persisted in the database, while the cart items are kept in a GenServer.

## **Requirements**

### 1. **GET /products endpoint**
    Create an endpoint that returns a list of products. Each product has the following fields: name, description, price. The products are stored in the database

### 2. **POST /products endpoint**
    Create a product and store it in the database

### 3. **GET /cart endpoint**
    List the items in the shopping cart, along with the sum of all the product prices

### 4. **PUT /cart endpoint**
    Add an item to the shopping cart. The item data is sent in the request body

### 5. **DELETE /cart/:id endpoint**
    Remove an item from the shopping cart by product ID

### 6. **POST /cart/checkout endpoint**
    Complete the order. The endpoint accepts an object with user details (name, address etc.) and returns a "Thank you"
    message (eg. "Thank you for your order, XXX. The products will be shipped to YYY).
    This actions should also clear the list of cart items.

### *7. Add UI (MVC or LiveView) that use all of the above endpoints


### *8. Add authentication for the user and add registries.
