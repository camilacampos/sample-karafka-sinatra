require_relative 'base'

module Consumers
  class Example < Consumers::Base
    def consume
      Karafka.logger.info "Consumed following messages: #{params_batch}"

      respond_with(any: 'data')
    end
  end
end
