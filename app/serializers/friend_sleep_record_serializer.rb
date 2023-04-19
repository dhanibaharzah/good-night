class FriendSleepRecordSerializer
  include Singleton
  
  def serialize(sleep_records)
    sleep_records.map do |record|
      {
        id: record.id,
        user: record.friend.name,
        clocked_in: record.friend.sleep_records[0].start_time,
        clocked_out: record.friend.sleep_records[0].end_time,
        duration: record.friend.sleep_records[0].duration
      }
    end
  end
end