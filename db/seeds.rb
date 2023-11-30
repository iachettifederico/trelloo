# frozen_string_literal: true

puts "Models".yellow

[Board, List, Task].each do |model_class|
  model_class.destroy_all
end

board = Board.create!(name: "Main Board")

%w[Backlog Doing Done].each.with_index do |list_name|
  list = board.lists.create!(name: list_name)

      rand(5..10).times do |task_position|
      list.tasks.create!(
        name:        "#{Faker::Verb.base.capitalize} #{Faker::Hobby.activity}",
        description: Faker::Lorem.sentence(word_count: 10),
      )
end

