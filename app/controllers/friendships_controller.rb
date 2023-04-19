class FriendshipsController < ApplicationController
  # bypassing this in order to see the logic is running, not recommended to use this in production
  protect_from_forgery with: :null_session
  
  def actions
    Friendship::FriendshipsService.new(params).call
    render_json
  end
end
