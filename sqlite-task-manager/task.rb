class Task
  attr_accessor :id, :title, :description, :done
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def save
    if @id.nil?
      DB.execute(
        "INSERT INTO tasks (title, description, done) VALUES (?,?,?)",
        title, description, done == true ? 1 : 0)
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ?", title, description, done ? 0 : 1)
    end
    self
  end

  def destroy(id)
    DB.execute("DELETE FROM tasks  WHERE ? = tasks.id", id)
  end


  def self.find(id)
    # 1. créer la requette SQL
      # 2. executer
    result = DB.execute("SELECT * FROM tasks WHERE ? = tasks.id", id).first

    return nil if result.nil?

    # 3. le retour est un has
    # 2. Créer une instance à partir du résultat
    Task.new(
      id: id,
      title: result["title"],
      description: result["description"],
      done: result["done"].to_i == 1 ? true : false
    )
  end
end
