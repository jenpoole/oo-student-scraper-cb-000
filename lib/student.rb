class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  # 1. Student #new takes in an argument of a hash
  def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value) # 2. and sets that new student's attributes using the key/value pairs of that hash
    end
    @@all << self # 3. add that new student to the Student class' collection of all existing students, stored in the `@@all` class variable.
  end

  # Student .create_from_collection uses the Scraper class to create new students with the correct name and location.
  def self.create_from_collection(students_array)
    students_array.each do |student_hash|
      Student.new(student_hash)
    end
  end

  # Student #add_student_attributes uses the Scraper class to get a hash of a given students attributes and uses that hash to set additional attributes for that student.
  def add_student_attributes(attributes_hash)

  end

  # Student .all returns the class variable @@all
  def self.all
    @@all
  end
end


=begin
  #send method sends a message to an object instance and its ancestors in class hierarchy
  until some method reacts (because its name matches the first argument).

  Practically speaking, these lines are equivalent:

    1.send('+', 2)
    #=> 3
    Translation: Apply the addition method with a value of 2, to the object, which is 1

    1.+(2)
    #=> 3
    Translation: Call the addition method with 2 as an argument, on the object, which is 1

    1 + 2
    #=> 3
    Translation: Add 2 to the object, which is 1
=end
