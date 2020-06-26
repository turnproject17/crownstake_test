# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

setup Application

* rake db:migrate
* rake db:seed

APIs

> endpoint = http://localhost:3000/api/v1

* Login 

>
  path = "/sessions"
  method = "post"
  params = {
            auth: {
                  login: "f@gmail.com",
                  password:"121212"
                }
              }
  response = {
              success:true,
              authorization:{
                  access_token: "eyJhbGciOiJIUzI1NiJ9.***.xxxxxxxxx",
                  type: "Bearer"
                  },
                  user: {
                    id:1,
                    email:"f@gmail.com",
                    created_at:"2020-06-26T10:01:18.455Z",
                    updated_at:"2020-06-26T10:01:18.455Z"
                    }
                  }
* All products
> path = "/products"
  method = "get"
  response = {
              "products": [
                  {
                      "id": 1,
                      "name": "new",
                      "description": "asd",
                      "price": "102.0",
                      "make": 2012
                  },
                  {
                      "id": 2,
                      "name": "new second",
                      "description": "asd",
                      "price": "210.0",
                      "make": 2012
                  }
                ]
              }
* Get Current Cart's order
> path = "/order"
  method = "get"
  response = {
                "order": {
                    "id": 1,
                    "number": "CS733864494",
                    "amount": "0.0",
                    "state": "active",
                    "placed_at": null,
                    "created_at": "2020-06-26T15:00:10.470Z",
                    "line_items": []
                }
              }
* Add Product to current cart
> path = "/order"
  method = "put/patch"
  params = {
              "order": {
                "line_items_attributes": [
                    {
                      "product_id":"1",
                      "quantity":"2",
                      "id":"1"
                    }
                  ]
              }
            }
  response = {"success":true}
  > to delete a line item from order
    params = {
              "order": {
                "line_items_attributes": [
                    {
                      "id":"1",
                      "_destroy":true,
                    }
                  ]
                }
              }
  