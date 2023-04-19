module SleepTracker
  class CreateSleepRecordService
    def initialize(params)
      @params = params
    end
    
    def call
      create_sleep_record if check_user?
    rescue ActiveRecord::RecordNotFound => e
      e
    end
    
    private
    
    def create_sleep_record
      SleepRecord.create!(sleep_record_params)
    end
    
    def check_user?
      User.find(@params[:user_id])
    end
    
    def sleep_record_params
      {
        user_id: @params[:user_id],
        start_time: @params[:start_time]
      }
    end
  end
end