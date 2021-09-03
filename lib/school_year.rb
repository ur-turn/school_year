require 'date'

class SchoolYear
class << self

  def grade_to_graduation_year(grade, academic_year=academic_year(Date.today))
    return nil unless (0..12).include? grade
    academic_year + (12 - grade)
  end

  def grade_to_year(grade, standard_graduation_year)
    standard_graduation_year - 12 + grade
  end

  def year_to_grade(year, standard_graduation_year)
    year + 12 - standard_graduation_year
  end

  def academic_year(date)
    date.year + (date.month < 7 ? 0 : 1)
  end

  def grade_on_date(date, standard_graduation_year)
    year_to_grade(academic_year(date), standard_graduation_year)
  end

  def default_first_day_of_school(academic_year_or_date)
    if academic_year_or_date.class == Integer
      Date.new(academic_year_or_date - 1, 9, 1)
    elsif academic_year_or_date.class == Date
      Date.new(academic_year_or_date.year - (academic_year_or_date.month < 7 ? 1 : 0), 9, 1)
    end
  end

  def default_last_day_of_school(academic_year_or_date)
    if academic_year_or_date.class == Integer
      Date.new(academic_year_or_date, 6, 15)
    elsif academic_year_or_date.class == Date
      Date.new(academic_year_or_date.year + (academic_year_or_date.month < 7 ? 0 : 1), 6, 15)
    end
  end

  def school_days_elapsed(date = nil, first_attendance_day = nil)
    if date
      first_attendance_day ||= default_first_day_of_school(date)
      (date - first_attendance_day) * 5 / 7.0
    else
      (default_last_day_of_school(1901) - default_first_day_of_school(1901)) * 5 / 7.0 # 1901 in order to miss leap year
    end
  end

end
end
