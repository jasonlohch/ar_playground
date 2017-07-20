# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end


####################################
# Write your test code here

# 1. Create a new student using new and save
@student = Student.new(name: "Jason", email: "jason@next.com", age: 30)
@student.save
# 2. Create a new student using create
@student = Student.create(name: "Jason Loh", email: "jasonloh@jason.com", age: 30)

# 3. Select all students
p Student.all
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?

# Why can't you do Student.name or Student.email?

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.first
# 5. Select the last student
p Student.last
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
Student.all.each do |stu|
 	puts " #{stu.id}. Name: #{stu.name}, Email; #{stu.email}, Age; #{stu.age}"
 end
	
Student.all.each_with_index do |stu, index|
 	puts "#{index+1}. Name: #{stu.name}, Email; #{stu.email}, Age; #{stu.age}"
 end
# 7. Find student by the name Dr. Lois Pfeff using where.
p Student.where(name: "Dr. Lois Pfeff")
p Student.where(age: 20)

# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?

# What will the following return to you? (remember to comment out the code!)
# p student.id
# p student.name
# p student.email
# p student.age


# 8. Find student by name using find_by
student = Student.find_by(age: 20)
p "This age 20 student is #{student.name}"
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?

# What will the following return to you?
# p student.id
# p student.name
# p student.email
# p student.age

# Do research on the difference between "where" and "find_by".
# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
p @studentb = Student.find(10)
p @studentc = Student.find_by(id: 10)

# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
@student5 = Student.find(5)
@student5.update(email: "ssy@exaxmple.com")
p @student5
# 11. Now use update to update this student's age to 21.
@student5.update(age: 21)
p @student5
# 12. Delete student with id 21 using delete
Student.delete(2)
 Student.all.each do |stu|
 	puts " #{stu.id}. Name: #{stu.name}, Email; #{stu.email}, Age; #{stu.age}"
 end
# 13. Delete student with id 22 using destroy
Student.all[1].destroy

# 14. Update
Student.all.each_with_index do |stu, index|
	stu.update(id: index+1)
end
Student.all.each do |stu|
 	puts " #{stu.id}. Name: #{stu.name}, Email; #{stu.email}, Age; #{stu.age}"
 end