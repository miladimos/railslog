class Api::ApiBaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def handle_not_found
    render json: { message: "Record not found" }, status: :not_found
  end
end
