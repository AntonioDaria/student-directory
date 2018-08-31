@students = []

def print_menu
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show all the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from a file of your choice"
  puts "5. Show students from April cohort"
  puts "9 Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    when "5"
      april_cohort
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again"
  end 
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return 4 times"
  name = STDIN.gets.strip
  puts "Please enter the country of birth of the students"
  puts "To finish, just hit return 4 times"
  cob = STDIN.gets.strip
  puts "Please enter the hobby of the students"
  puts "To finish, just hit return 4 times"
  hobby = STDIN.gets.strip
  puts "Please enter the cohort of the students"
  puts "To finish, just hit return 4 times"
  cohort = STDIN.gets.strip
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << { name: name, country_of_birth: cob, hobby: hobby, cohort: cohort }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.strip
    cob = STDIN.gets.strip
    hobby = STDIN.gets.strip
    cohort = STDIN.gets.strip
  end
end

def show_students
  print_header
  empty_list_message
  default_cohort
  print
  print_footer
end

def april_cohort
  print_header
  empty_list_message
  default_cohort
  print_by_cohort
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print
  count = 1
  while count <= 1 do
      for i in @students do
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
      puts "Insert new students or choose from menu options to load existing ones".center(50)
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

def save_students
  # open the file for writing
   File.open("students.csv", "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:country_of_birth], student[:hobby], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Students saved successfully!!! please choose from the menu options to display"
end#file.close
end

File.open('foo', 'w') do |f|
  f.write "bar"
end

def load_students (filename = "students.csv")
  puts "Insert the file name"
  @user = gets.chomp
  if @user != filename 
    puts "filename not recognised"
  else
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, country_of_birth, hobby, cohort = line.chomp.split(',')
    @students << {name: name, country_of_birth: country_of_birth, hobby: hobby, cohort: cohort}
  end
  puts "Students loaded successfully!!! please choose from the menu options to display"
  file.close
end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
  