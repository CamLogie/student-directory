#put students into an array
students = [
   "Dr. Hannibal Lecter",
   "Darth Vader",
   "Nurse Ratched",
   "Michael Corleone",
   "Alex DeLarge",
   "The Wicked Witch of the West",
   "Terminator",
   "Freddy Krueger",
   "The Joker",
   "Joffrey Baratheon",
   "Norman Bates"
 ]

puts "The Students of Villains Academy"
puts "---------------"
# now print them
students.each do |students|
  puts students
end

#let's print the total number of students
puts "Overall, we have #{students.count} great students"
