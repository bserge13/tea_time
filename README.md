# Tea Time Services 

Tea Time is an API that works to manage customers tea subscriptions. To use Tea Times' you will either be in the need of creating a subscription for a customer, list an index of all subscriptions (inactive, active or cancelled) for a given customer, or alter a customers subscription status to reflect the neccessary changes. 


## Getting Started

This project uses Ruby version 3.2.2.

### Database Setup

To initialize the database, run the following commands:

`rails db:{drop,create,migrate,seed}`

### Running the Test Suite

To run the test suite, execute the following command:

`bundle` or `bundle install`
`bundle exec rspec`

All tests should be passing (31/31). 

### Running the Server

To run the server, execute the following command:

`rails s`

#### Tea Time Endpoints:

**CustomerSubscriptions CRUD**

- **New Customer Subscription**
    
    - POST `api/v0/customer_subscriptions`
    
    Requires the params of an existing customers id, and an existing subscriptions id. Subscriptions can exist with or without teas associated to them. 

- **Customers Subscriptions Index**
    
    - GET `api/v0/customer_subscriptions/:customer_id/subscriptions`

- **Cancelling a Customers Subscription**
    
    - PATCH `api/v0/customer_subscriptions/cancel_subscription/:customer_sub_id`
    
    Requires the params of an existing customer_subscription id within the url, while the body contains the customers email and password. This will update the status of a subscription from active to cancelled. 

## Gems 

- [bcrypt](https://github.com/dcodeIO/bcrypt.js/blob/master/README.md)
    - `gem "bcrypt", "~> 3.1.7"`
- [json:api](https://jsonapi.org/)
    `gem 'jsonapi-serializer'`

#### Placed in `group :test` block:

- [rspec-rails](https://github.com/rspec/rspec-rails)
    - `gem "rspec-rails"`
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
    - `gem 'simplecov'`
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
    - `gem "shoulda-matchers"`

#### Placed in `group :development, :test` block:

- [Pry](https://github.com/pry/pry)
    - `gem "pry"`

## Contributors

* Blake Sergesketter
    * [Blake's LinkedIn](https://www.linkedin.com/in/b-sergesketter/)
    * [Blake's Github](https://github.com/bserge13)

## IMPORTANT INFO FOR DEVS

**Info**
- subscriptions have many teas, and their status is an enum with default value: 0 [inactive, active, cancelled] 
- teas belong to subscriptions
- Customers and Subscriptions are associated through the joins table, CustomerSubscriptions which takes in a customer and subscription id
- CustomerSubscription functions happy and sad path tested
- Customer, Subscription, and Tea model tested for validations and relationships  
