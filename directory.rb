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

  name = STDIN.gets.chomp

  while !name.empty? do
    shovel_students(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def shovel_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def selection_successful
  puts 'Selection successful'
  puts '--------------'.center(4)
end

def process(selection)
  case selection
  when "1"
    selection_successful
    input_students
  when "2"
    selection_successful
    print_header
    print_students_list(@students)
    print_footer(@students)
  when "3"
    selection_successful
    save_students
  when "4"
    selection_successful
    load_students
  when "9"
    selection_successful
    exit
  else puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def ask_for_file
puts 'Which file would you like to use?'
file = STDIN.gets.chomp
  return file
end

def save_students
  ask_for_file
  File.open(ask_for_file) do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = ask_for_file)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      shovel_students(name, cohort.to_s)
    end
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} from students.csv"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
