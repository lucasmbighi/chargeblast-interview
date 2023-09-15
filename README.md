# chargeblast-interview

Task, using the Vapor library, build an web app that supports the following endpoint specifications. Your app will need to save data locally to a database as well as be deployed on a live URL somewhere. We recommend deploying it on Heroku and using [Neon.tech](https://neon.tech/) which lets you create a free postgres connection, but if you prefer to deploy and create your db elsewhere you are free to do so.

## Specifications

You need to create the app using Vapor. I'd first recommend creating a hello world Vapor application via their docs [here](https://docs.vapor.codes/getting-started/hello-world/). If you get stuck with Vapor you can join their discord or message me directly and I can help you. Don't be afraid to ask questions.

## Technical Requirements

You need to build an endpoint that allows the user to send a Order object and retreive it later. The endpoint to retreive all of the orders should look like this:

GET https://www.yourdomain.com/api/orders
```
{
   orders: [{
      id: "7e22c55e-53fc-11ee-8c99-0242ac120002",
      price: 100.00,
      currency: "USD",
      product: "Nike Air Jordans",
      customer_email: "jason1882@gmail.com"
   },
   {
      id: "dc4aab7e-53fc-11ee-8c99-0242ac120002",
      price: 30.00,
      currency: "USD",
      product: "Nike T-Shirt",
      customer_email: "jeremy1521@gmail.com"
   }]
}
```

The endpoint to add an order to the store should look like this:


POST https://www.yourdomain.com/api/order


```
request.body

{
   order: {
      id: "7e22c55e-53fc-11ee-8c99-0242ac120002",
      price: 40.00,
      currency: "USD",
      product: "Nike Air Max",
      customer_email: "melissa18531@gmail.com"
   }
}
```

For extra credit, create a third endpoint that returns all the orders with a string that matches the product name passed in. Like this:

POST https://www.yourdomain.com/api/find/orders


```
request.body
{
   name: "Nike Air Max"
}
```

```
RESPONSE
{
   orders: [{
      id: "1ca3d55e-31fc-11ee-8c99-0242ac120002",
      price: 50.00,
      currency: "USD",
      product: "Nike Air Max",
      customer_email: "jackson1821@gmail.com"
   },
   {
      id: "dc4aab7e-53fc-11ee-8c99-0242ac110002",
      price: 45.00,
      currency: "USD",
      product: "Nike Air Max",
      customer_email: "jeremy18219@gmail.com"
   }]
}
```

