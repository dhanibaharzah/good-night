module SleepTracker
  class GetSleepRecordsService
    def call
      sleep_records
    end
    
    private
    
    def sleep_records
      SleepRecord.joins(:user).order(created_at: :desc)
    end
  end
end
