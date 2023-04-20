class SleepTrackerController < ApplicationController 
  # bypassing this in order to see the logic is running, not recommended to use this in production
  protect_from_forgery with: :null_session
  
  before_action only: %i[clock_in] do
    validate_params!(Contracts::SleepTracker::ClockIn.new)
  end
  
  def index
    service = SleepTracker::GetSleepRecordsService.new.call
    data = SleepTrackerSerializer.instance.serialize(service)
    
    render_json(data)
  end
  
  def clock_in
    SleepTracker::CreateSleepRecordService.new(params).call
    
    render_json
  rescue ActiveRecord::RecordNotFound => e
    raise TriplaApiError::NotFoundError
  end
  
  def clock_out
    SleepTracker::CreateSleepRecordService.new(params).call
    
    render_json
  rescue TriplaApiError::BaseError => e
    render_json(e.data, e.http_status_code, e.message)
  end
end
