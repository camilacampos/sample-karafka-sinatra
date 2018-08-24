require_relative 'base'

module Consumers
  class Example < Consumers::Base
    def consume
      Karafka.logger.info "Consumed following message: #{params}"

      respond_with({any: 'data'})
    end
  end
end
