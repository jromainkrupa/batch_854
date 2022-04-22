require_relative "task"

class Controller
  def initialize(repository, view)
    # TODO
    @repository = repository # injection de Dépendance
    @view = view
  end

  # Afficher toutes les taches au user
  def list
    # 1. Demander au repo toutes les taches
    tasks = @repository.all
    # 2. La Vue va display les taches
    @view.display_tasks(tasks)
  end

  def add_a_task
    # 1. Demander au user la description de la tache
    # 2. stocker la description
    description = @view.ask_for_description
    # 3. Créer une instance de task
    task = Task.new(description)
    # 4. on ajoute au repo notre tache
    @repository.add(task)
  end

  def mark_as_done
    # 1. On affiche la list au user
    list
    # 2. On demande quelle tache le user souhaite mark as done
    task_index = @view.ask_task_to_mark_as_done
    # 3. On retrouve la tache dans le repo
    task = @repository.find(task_index)
    # 5. On mark as done la tache
    task.mark_as_done
  end
end
