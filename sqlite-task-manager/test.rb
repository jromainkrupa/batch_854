require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"


# Create
Task.new(title: "CRUD create task", description: 'toto', done: true).save
task = Task.find(2)
p task.done?

# => 2

# Read
# task = Task.find(1)
# task.done?
# # => false
# task.title
# => Complete the Livecode

# UPDATE
# task = Task.find(1)
# task.title = "update the livecode"
# task.save
# p task.title

# DELETE

# task = Task.find(1)
# task.destroy
# Task.find(1)
# => nil


task1 = Task.new(title: "bon weekend", done: false).save
p task1.done?

task2 = Task.new(title: "rebon et bonne fin de wagon weekend", done: true).save
p task2.done?
