module SleepTracker
  class CreateSleepRecordService
    def initialize(params)
      @params = params
    end
    
    def call
      raise TriplaApiError::NotFoundError unless check_user?
      
      if @params[:clock_in].present?
        raise TriplaApiError::DuplicateRecordError unless get_sleep_record.nil?
        clock_in_record
      elsif @params[:clock_out].present?
        clock_out_record
      end
    end
    
    private
    
    def check_user?
      User.find(@params[:user_id]).present?
    end
    
    def get_sleep_record
      SleepRecord.find_by(
        user_id: @params[:user_id],
        end_time: nil
      )
    end
    
    def clock_in_record
      SleepRecord.create!(
        user_id: @params[:user_id],
        start_time: @params[:clock_in]
      )
    end
    
    def clock_out_record
      get_sleep_record.update!(
        end_time: @params[:clock_out],
        duration: Time.parse(@params[:clock_out]) - get_sleep_record.start_time
      )
    end
  end
end
