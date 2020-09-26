#put students into an array

def print_header
  puts "The Students of Villains Academy"
  puts "---------------"
end

def print(names)
  names.each_with_index do |names, ind|
    puts "#{ind + 1}. #{names[:name]} (#{names[:cohort]}) cohort"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  return students
end

def interactive_menu
  students = []
  loop do
  #1. print the menu and ask the user what to do
  puts '1. Input the students'
  puts '2. Show the students'
  puts '9. Exit'
  #2. read the input and save it into a variable
  selection = gets.chomp
  #3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      break
    else puts "I don't know what you meant, try again"
    end
  end
end


interactive_menu
