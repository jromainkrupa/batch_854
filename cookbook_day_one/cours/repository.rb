class Repository
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task # task est un instance...
  end

  def all
    @tasks
  end

  def delete(task)
    @tasks.delete(task)
  end

  def find(index)
    @tasks[index]
  end
end
