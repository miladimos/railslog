class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authentication
  # include Pundit::Authorization

  before_action :update_last_seen_at, if: -> { user_logged_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 5.minutes.ago) }

  def update_last_seen_at
    # logger.info "Update last seen at timestamp for user id #{current_user.id}"
    current_user.update_attribute(:last_seen_at, Time.current)
  end
end
