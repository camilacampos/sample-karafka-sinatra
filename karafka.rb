require_relative 'consumers/example'
require_relative 'consumers/response'
require_relative 'responders/example'
require_relative 'responders/foobar'

ENV['RACK_ENV'] ||= 'development'
ENV['KARAFKA_ENV'] ||= ENV['RACK_ENV']

Bundler.require(:default, ENV['KARAFKA_ENV'])
Karafka::Loader.load(Karafka::App.root)

class KarafkaApp < Karafka::App
  setup do |config|
    config.kafka.seed_brokers = %w[kafka://127.0.0.1:9092]
    config.client_id = 'example_app'
    config.backend = :inline
    config.batch_fetching = true
  end

  after_init do |config|
    # Put here all the things you want to do after the Karafka framework
    # initialization
  end

  Karafka.monitor.subscribe(Karafka::Instrumentation::Listener)

  consumer_groups.draw do
    consumer_group :default_group do
      topic :example do
        consumer ::Consumers::Example
        responder ::Responders::Example
      end

      topic :response do
        consumer ::Consumers::Response
      end
    end
  end
end

KarafkaApp.boot!
