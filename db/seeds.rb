# frozen_string_literal: true

require "faker"

puts "Creating Boards"
board = Board.create!(name: "Main Board")

print "Creating lists ".cyanish
%w[Backlog Doing Done].each do |list_name|
  print ".".cyan
  list = board.lists.create!(name: list_name, color: Colors.new.sample)

  puts
  print "Creating tasks for #{list_name.cyan} ".cyanish
  rand(5..10).times do |task_position|
    print ".".cyan
    list.tasks.create!(
      name:        "#{Faker::Verb.base.capitalize} #{Faker::Hobby.activity}",
      position:    task_position,
      description: Faker::Lorem.sentence(word_count: 10),
    )
  end
end
