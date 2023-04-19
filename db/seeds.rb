# Create some users
user1 = User.create(name: "Alice")
user2 = User.create(name: "Bob")
user3 = User.create(name: "Charlie")

# Create some sleep records for the users
user1.sleep_records.create(start_time: 8.hours.ago, end_time: 6.hours.ago)
user1.sleep_records.create(start_time: 10.hours.ago, end_time: 8.hours.ago)
user2.sleep_records.create(start_time: 6.hours.ago, end_time: 4.hours.ago)
user3.sleep_records.create(start_time: 12.hours.ago, end_time: 10.hours.ago)
