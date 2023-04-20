class FriendshipsController < ApplicationController
  # bypassing this in order to see the logic is running, not recommended to use this in production
  protect_from_forgery with: :null_session
  
  before_action only: %i[actions] do
    validate_params!(Contracts::Friendships::Action.new)
  end 
  
  def actions
    Friendship::FriendshipsService.new(params).call
    render_json
  rescue TriplaApiError::BaseError => e
    render_json(e.data, e.http_status_code, e.message)
  end
  
  def sleep_records
    service = Friendship::FriendSleepRecordsService.new(params).call
    data = FriendSleepRecordSerializer.instance.serialize(service)
    
    render_json(data)
  end
end
