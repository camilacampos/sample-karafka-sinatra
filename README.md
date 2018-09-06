# Sampa Karafka and Sinatra app

## Karafka & Sinatra
[Karafka](https://github.com/karafka/karafka) is a framework used to simplify Apache Kafka based Ruby applications development.

[Sinatra](https://github.com/sinatra/sinatra) is a DSL for quickly creating web applications in Ruby with minimal effort.

## Goal
This repository was created for a sample application that uses a web api and also listens and writes to Apache Kafka topics.

## Organization
#### Configuration
Defined on [karafka.rb](karafka.rb), this app assumes you have Kafka running on `127.0.0.1:9092`. 
In this file, it's also defined a consumer group for the app named `default_group` with two topics (with consumers and responders) `example` and `response`.

Api configuration and a sample endpoint is defined on [api.rb](api.rb).

#### API
A simple [GET endpoint](api.rb) `/frank-says` that is responsible for publising a message using a Responder.

#### Responders
Are the ones responsible for writing messages to a given Kafka topic. They are:
- [Responders::Foobar](responders/foobar.rb), used on the sinatra sample endpoint to send a message to the `example` topic.
- [Responders::Example](responders/example.rb), used by the `Consumers::Example` (defined on karafka config file), 
responding the consumer's message to the `response` topic.

#### Consumers
Are the ones responsable for listening to Kafka topics. They are:
- [Consumers::Example](consumers/example.rb), that listens to the topic `example` (defined on karafka config file), 
logs the consumed message and responds to the `response` topic using [Responders::Example](responders/example.rb) (also defined on karafka config file).
- [Consumers::Response](consumers/response.rb), that listens to the topic `response` (defined on karafka config file) 
and logs the consumed message.

## Running the app
- Run `karafka server` on your terminal to start the Karafka server.
- Run `bundle exec ruby api.rb` on another tab of your terminal to start Sinatra.
