class SleepTrackerController < ApplicationController 
  # bypassing this in order to see the logic is running, we not put this in production
  protect_from_forgery with: :null_session
  
  def index
    service = SleepTracker::GetSleepRecordsService.new.call
    data = SleepTrackerSerializer.instance.serialize(service)
    
    render_json(data)
  end
  
  def create
    render_json(
      SleepTracker::CreateSleepRecordService.new(params).call
    )
  end
end
