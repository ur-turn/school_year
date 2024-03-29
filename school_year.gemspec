Gem::Specification.new do |s|
  s.name        = 'school_year'
  s.version     = '0.2.0'
  s.date        = '2021-09-02'
  s.summary     = "School Year Logic"
  s.description = "
    # School Year
    Simple logic for translating between academic year and grade for a student

    ## Sample Usage
    `SchoolYear.grade_to_graduation_year(grade, academic_year)` determines the graduation year for a student based on their grade and the academic year\
    `SchoolYear.grade_to_year(grade, graduation_year)` determines the calendar year from the student's grade based on the graduation year
    `SchoolYear.year_to_grade(year, graduation_year)` determines the student's grade from the calendar year based on the graduation year
    `SchoolYear.default_first_day_of_school(academic_year_or_date)` determines the first day of school (as September 1st) based on an integer representing the academic year (e.g., 1998), or a date (e.g., '1998-04-04'.to_date)
    `SchoolYear.default_last_day_of_school(academic_year_or_date)` determines the last day of school (as June 15th) based on an integer representing the academic year (e.g., 1998), or a date (e.g., '1998-04-04'.to_date)
    `SchoolYear.school_days_elapsed(date, first_attendace_day)` determines the approximate number of days elapsed from the first_attendance_day to the date. Both arguments can be blank: if date is blank, the approximate number of total days in the 1901 school year will be returned.
    "
  s.authors     = ["Peter Kirwin"]
  s.email       = 'peter@puzzlesandwich.com'
  s.files       = ["lib/school_year.rb"]
  s.homepage    = 'http://www.puzzlesandwich.com'
  s.license       = 'MIT'
end
