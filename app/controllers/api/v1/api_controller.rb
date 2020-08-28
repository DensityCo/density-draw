class Api::V1::ApiController < ApplicationController  
  include Secured

  before_action :authenticate_request!
  skip_before_action :verify_authenticity_token
end
