  require_relative 'base'

module Consumers
  class Response < Consumers::Base
    def consume
      Karafka.logger.info "Consumed following response: #{params}"
    end
  end
end
