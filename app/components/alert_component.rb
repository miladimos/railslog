# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message:, type:)
    @message = message
    @type = type
  end

end
# <%= render(AlertComponent.new(type: "success", message: "message")) %>