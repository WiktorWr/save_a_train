# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id unless defined?(current_user).nil?
  end
end
