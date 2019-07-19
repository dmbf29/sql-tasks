require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# TODO: CRUD some tasks
test1 = Task.find(1)
puts "#{test1.title} - #{test1.description}"

test2 = Task.new(title: "coding", description: "tired")
test2.save
puts test2.id

test2 = Task.find(2)
test2.title = "updated_title"
test2.save
p test2

tasks = Task.all
puts tasks.class == Array
puts tasks.first.class == Task

task_to_delete = Task.find(1)
task_to_delete.destroy

p Task.all.first


