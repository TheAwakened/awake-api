class API::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Knock::Authenticable

  def not_found
    render json: { error: "Not Found" }, status: 404
  end

end
