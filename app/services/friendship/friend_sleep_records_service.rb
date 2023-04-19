module Friendship
  class FriendSleepRecordsService
    START_PREV_WEEK = Date.today.prev_week.at_beginning_of_week
    END_PREV_WEEK = Date.today.prev_week.at_end_of_week
    
    def initialize(params)
      @params = params
    end
    
    def call
      get_friends_sleep_records
    end
    
    private
    
    def get_friends_sleep_records
      start_of_previous_week = START_PREV_WEEK.strftime('%Y-%m-%d %H:%M:%S')
      end_of_previous_week = END_PREV_WEEK.strftime('%Y-%m-%d %H:%M:%S')
      
      Friend.joins(friend: :sleep_records).where(user_id: @params[:user_id])
      .where(sleep_records: {start_time: start_of_previous_week..end_of_previous_week})
      .order('sleep_records.duration DESC')
    end
  end
end