require_relative 'base'

module Responders
  class Example < Responders::Base
    topic :response

    def respond(data)
      respond_to :response, data
    end
  end
end
