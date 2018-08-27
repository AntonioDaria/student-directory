# Let's put all the sudents into an array
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
# and print them
puts "The students of Villains Academy"
puts "-------------"
students.each {|students| puts students}
#finally, we print the total number of students
print "Overall, we have #{students.count} great students"
