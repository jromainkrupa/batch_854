class View
  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      status = task.done? ?  "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{task.description}"
    end
  end

  def ask_for_description
    puts "Which task do you want to do?"
    print "> "
    return gets.chomp
  end

  def ask_task_to_mark_as_done
    puts "Wich task would you like to mark as done?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
