@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return 4 times"
  name = gets.strip
  puts "Please enter the country of birth of the students"
  puts "To finish, just hit return 4 times"
  cob = gets.strip
  puts "Please enter the hobby of the students"
  puts "To finish, just hit return 4 times"
  hobby = gets.strip
  puts "Please enter the cohort of the students"
  puts "To finish, just hit return 4 times"
  cohort = gets.strip
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << { name: name, country_of_birth: cob, hobby: hobby, cohort: cohort }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.strip
    cob = gets.strip
    hobby = gets.strip
    cohort = gets.strip
  end
end

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from students.csv"
  puts "9 Exit"
end

def show_students
  print_header
  empty_list_message
  default_cohort
  print_by_cohort
  print_footer
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, country_of_birth, hobby, cohort = line.chomp.split(',')
    @students << {name: name, country_of_birth: country_of_birth, hobby: hobby, cohort: cohort}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:country_of_birth], student[:hobby], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again"
  end 
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print
  count = 1
  while count <= 1 do
      for i in students do
          puts "#{i[:name]} (#{i[:cohort]} cohort) (#{i[:country_of_birth]}) (#{i[:hobby]})".center(55)
      end
      count += 1
  end
end

def print_by_cohort
  @students.map do | student |
    if student[:cohort] == "april"
        puts "#{student[:name]} (#{student[:cohort]}) (#{student[:country_of_birth]}) (#{student[:hobby]})".center(55)
    end
  end
end

def default_cohort
  cohort = "april"
  @students.map do |student|
      if student[:cohort].empty? 
          puts "#{student[:name]} (#{cohort}) (#{student[:country_of_birth]}) (#{student[:hobby]})".center(55)
      end
  end
end

def empty_list_message
  if @students.empty?
      puts "no values inserted".center(50)
  end
end

def print_footer
  puts "-------------".center(50)
  if @students.count < 2
      puts "Overall, we have #{@students.count} great student".center(50)
  else
      puts "Overall, we have #{@students.count} great students".center(50)
  end
end

interactive_menu
  