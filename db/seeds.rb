# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Tag.destroy_all

Post.create(title: 'NYC', tag_list: '#nyc, #bestcityever', picture: File.new(Rails.root.join 'spec/images/nyc1.png'), user_id: 1, address: "New York City", price: 5.00)
Post.create(title: 'NYC B&W', tag_list: '#nyc, #blackandwhite', picture: File.new(Rails.root.join 'spec/images/nyc2.jpg'), user_id: 1, address: "New York City", price: 5.00)
Post.create(title: 'NYC made of Legos', tag_list: '#nyc, #legos', picture: File.new(Rails.root.join 'spec/images/nyc3.jpg'), user_id: 1, address: "New York City", price: 5.00)
Post.create(title: 'London Streets', tag_list: '#ldn, #bestcityever', picture: File.new(Rails.root.join 'spec/images/ldn1.jpg'), user_id: 1, address: "London, UK", price: 5.00)
Post.create(title: 'London Cathedral', tag_list: '#ldn, #cathedral', picture: File.new(Rails.root.join 'spec/images/ldn2.jpg'), user_id: 1, address: "London, UK", price: 5.00)
Post.create(title: 'London at Night', tag_list: '#ldn, #night', picture: File.new(Rails.root.join 'spec/images/ldn3.jpg'), user_id: 1, address: "London, UK", price: 5.00)
Post.create(title: 'SF Golden Gate Bridge', tag_list: '#sf, #goldengatebridge', picture: File.new(Rails.root.join 'spec/images/sf1.jpg'), user_id: 1, address: "San Francisco, USA", price: 5.00)
Post.create(title: 'SF B&W', tag_list: '#sf, #blackandwhite', picture: File.new(Rails.root.join 'spec/images/sf2.jpg'), user_id: 1, address: "San Francisco, USA", price: 5.00)
Post.create(title: 'SF at Night', tag_list: '#sf, #night', picture: File.new(Rails.root.join 'spec/images/sf3.jpg'), user_id: 1, address: "San Francisco, USA", price: 5.00)
Post.create(title: 'Time', tag_list: '#time, #weaintgotnone', picture: File.new(Rails.root.join 'spec/images/time.jpg'), user_id: 1, address: "", price: 5.00)

# 1.upto(10) do |n|
#   tags = %w('#yolo, #bestcityever').sample(2).join(', ')
#   puts "Adding post number #{n}"
#   Post.create(title: 'NYC B&W', tag_list: '#{tags}', picture: File.new(Rails.root.join 'spec/images/time.jpg'))
# end