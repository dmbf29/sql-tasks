# require "pry-byebug"
class Task
  attr_accessor :title, :description, :id

  def initialize(attributes = {})
    @id = attributes[:id] || attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @description = attributes[:description] || attributes["description"]
    @done = attributes[:done] || attributes["done"] || false
  end

  def self.find(id)
    find1 = DB.execute("SELECT * FROM tasks WHERE id = ?", id)
    find1.empty? ? nil : Task.new(find1.first)
  end

  def self.all
    tasks = DB.execute("SELECT * FROM tasks")
    tasks.map { |task| Task.new(task) }
  end

  def save
    if @id
      DB.execute("UPDATE tasks SET title = ?, description = ? WHERE id = ?", @title, @description, @id)
    else
      DB.execute("INSERT INTO tasks (title, description)
      VALUES(?, ?)", title, description)
    @id = DB.last_insert_row_id
    end
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end
end





