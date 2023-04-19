class SleepTrackerController < ApplicationController 
  # bypassing this in order to see the logic is running, not recommended to use this in production
  protect_from_forgery with: :null_session
  
  before_action only: %i[create] do
    validate_params!(Contracts::SleepTracker::Create.new)
  end
  
  def index
    service = SleepTracker::GetSleepRecordsService.new.call
    data = SleepTrackerSerializer.instance.serialize(service)
    
    render_json(data)
  end
  
  def create
    SleepTracker::CreateSleepRecordService.new(params).call
    
    render_json
  rescue ActiveRecord::RecordNotFound => e
    render_json(nil, status = 404, msg = 'User not found')
  end
end
