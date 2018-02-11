require 'open-uri'
require 'pry'

class Scraper

  #scrape_index_page
  # is a class method that scrapes the student index page ('./fixtures/student-site/index.html')
  # and a returns an array of hashes in which each hash represents one student
  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))

    students = []

    # 1. in each student card
    html.css(".roster-cards-container").each do |student_card|
      # 2. in each div that links to the student's profile page
      student_card.css(".student-card a").each do |student|
        # 3. get student info
        student_profile_link = "#{student.attr('href')}" # link to student's profile page
        student_location = student.css(".student-location").text # student's location
        student_name = student.css("student-name").text # student's name

        # return value of this method should be an array of hashes in which each hash represents a single student
        # The keys of the individual student hashes should be :name, :location and :profile_url
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
