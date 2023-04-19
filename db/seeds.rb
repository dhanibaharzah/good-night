# Create some users
user1 = User.create(name: "Alice")
user2 = User.create(name: "Bob")
user3 = User.create(name: "Charlie")

# Calculate for previous week
today = Time.now
start_of_week = today.beginning_of_week(:sunday) # Get the start of the current week, assuming Sunday is the first day of the week
end_of_week = start_of_week - 1.second # Set the end time to one second before the start of the current week
start_of_previous_week = start_of_week - 1.week
end_of_previous_week = end_of_week - 1.week

# Create some sleep records for the users
user1.sleep_records.create(start_time: start_of_previous_week, end_time: 6.hours.ago, duration: start_of_previous_week - 6.hours.ago)
user1.sleep_records.create(start_time: start_of_week, end_time: 8.hours.ago, duration: start_of_week - 8.hours.ago)
user2.sleep_records.create(start_time: 6.hours.ago, end_time: 4.hours.ago, duration: 6.hours.ago - 4.hours.ago)
user3.sleep_records.create(start_time: 12.hours.ago, end_time: 10.hours.ago, duration: 12.hours.ago - 10.hours.ago)
