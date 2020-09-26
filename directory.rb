#put students into an array

@students = []

def print_header
  puts "The Students of Villains Academy"
  puts "---------------"
end

def print_students_list(names)
  names.each_with_index do |names, ind|
    puts "#{ind + 1}. #{names[:name]} (#{names[:cohort]}) cohort"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_prompt
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
end

def input_students

  input_prompt

  name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '9. Exit'
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_header
    print_students_list(@students)
    print_footer(@students)
  when "9"
    exit
  else puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end


interactive_menu
