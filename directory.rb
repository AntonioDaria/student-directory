def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return 4 times"
  name = gets.chomp
  puts "Please enter the country of birth of the students"
  puts "To finish, just hit return 4 times"
  cob = gets.chomp
  puts "Please enter the hobby of the students"
  puts "To finish, just hit return 4 times"
  hobby = gets.chomp
  puts "Please enter the cohort of the students"
  puts "To finish, just hit return 4 times"
  cohort = gets.chomp
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << { name: name, country_of_birth: cob, hobby: hobby, cohort: cohort }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    cob = gets.chomp
    hobby = gets.chomp
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each do |i|
      puts "#{i[:name]} (#{i[:cohort]}) (#{i[:country_of_birth]}) (#{i[:hobby]})".center(55)
  end
end

def print_footer(students)
  puts "-------------".center(50)
  if students.count < 2
      puts "Overall, we have #{students.count} great student".center(50)
  else
      puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)