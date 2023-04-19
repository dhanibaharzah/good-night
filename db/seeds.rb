# Create some users
user1 = User.create(name: "Alice")
user2 = User.create(name: "Bob")
user3 = User.create(name: "Charlie")

# Create some sleep records for the users
user1.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 6.hours.ago, duration: start_of_previous_week - 6.hours.ago)
user1.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 8.hours.ago, duration: start_of_week - 8.hours.ago)
user2.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 4.hours.ago, duration: 6.hours.ago - 4.hours.ago)
user3.sleep_records.create(start_time: Date.today.prev_week.at_beginning_of_week, end_time: 10.hours.ago, duration: 12.hours.ago - 10.hours.ago)
