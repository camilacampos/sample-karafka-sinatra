require_relative 'base'

module Responders
  class Foobar < Responders::Base
    topic :example

    def respond(data)
      respond_to :example, data
    end
  end
end
