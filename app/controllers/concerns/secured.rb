# frozen_string_literal: true
module Secured
  extend ActiveSupport::Concern

  def authenticate_request!
    # find the given user by their auth0 uid, email, or phone number
    # the jwt is verified by now, so we can trust these fields
    # if we can't find the user, just create them
    # note: a user might not have a uid, if they were invited by another user    
    puts "HELLO!!!!2"
    if Rails.env.development?
      puts "HELLO!!!!"
      @current_user = User.first
    else
      @token = JsonWebToken.verify(http_token)
      @email = @token[0]["email"]
      @current_user = User.where(email: @email).first
    end

    raise "Current user could not be authorized." if !@current_user

    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end

end
