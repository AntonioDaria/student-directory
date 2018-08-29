def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return 3 times"
  name = gets.chomp
  puts "Please enter the country of birth of the students"
  puts "To finish, just hit return 3 times"
  cob = gets.chomp
  puts "Please enter the hobby of the students"
  puts "To finish, just hit return 3 times"
  hobby = gets.chomp
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << { name: name, country_of_birth: cob, hobby: hobby, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    cob = gets.chomp
    hobby = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  count = 0
  while count < 1 do
   for i in students do
      puts "#{i[:name]} (#{i[:cohort]} cohort) (#{i[:country_of_birth]}) (#{i[:hobby]})".center(55)
   end
  count+=1
  end
end

def print_footer(students)
  puts "-------------".center(50)
  puts "Overall, we have #{students.count} great students".center(50)  
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)