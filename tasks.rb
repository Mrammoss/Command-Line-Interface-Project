require_relative 'chore'

class Tasks
  attr_accessor :chores
  
  def initialize
    @chores = []
    puts "\nHello...your tasks await..."
  end
  
  def run
    loop do
      puts "\nTasks Menu\n"
      puts "----------"
      puts '1 -- Tasks to complete'
      puts '2 -- Add Task'
      puts '3 -- Motivation'
      puts '4 -- Exit'
      print "\nEnter choice [1-4]:\n"

      choice = gets.chomp.to_i

      case choice
      when 1
        tasks_to_complete
      when 2
        user_add_task
      when 3
        motivation
      when 4
        puts 'Exiting. Til next time!'
        break
      else puts 'Please choose from the choices given.'
      end
    end
  end 

  def add_task(action, object_or_setting)
    chore = Chore.new(action, object_or_setting)
    @chores << chore
    puts "You have #{action} #{object_or_setting} on the list."
  end

  def tasks_to_complete
    puts "\nThese are the tasks you need to complete..."
    @chores.each do |chore|
      puts "#{chore.action} #{chore.object_or_setting}"
    end
  end

  def user_add_task
    puts 'Enter task type: ex., mow, clean, wash, etc.. -- Enter here:    [Type "exit" to finish]'
    chore_type = gets.chomp

    return if chore_type.downcase == 'exit'

    puts 'Enter the Object or Setting for the task:'
    chore_object_or_setting = gets.chomp

    add_task(chore_type, chore_object_or_setting)
  end

  def motivation
    quotes = ["A clean home is a happy home!",
    "Doing chores now means more time for fun later!",
    "Every little step helps. Start small and keep going!",
    "A tidy space leads to a tidy mind.",
    "Think of the satisfaction you'll feel once it's done!",
    "Cleanliness is next to happiness!",
    "Small efforts add up to big results.",
    "Chores done today means relaxation tomorrow!",
    "You'll feel so accomplished after finishing!",
    "Imagine how great it'll be to have everything clean!"]

    quote = quotes.sample

    puts quote
  end
end
    
