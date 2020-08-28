class HomeController < ApplicationController
  def health_check
    render json: {'status': 'ok'}, status: 200
  end
end