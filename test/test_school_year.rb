require 'minitest/autorun'
require 'school_year'
require 'date'

class SchoolYearTest < MiniTest::Test
  def test_grade_to_year
    assert_equal SchoolYear.grade_to_year(11, 2015), 2014
  end

  def test_year_to_grade
    assert_equal SchoolYear.year_to_grade(2013, 2015), 10
  end

  def test_academic_year
    assert_equal SchoolYear.academic_year(Date.new(2014,11,11)), 2015
    assert_equal SchoolYear.academic_year(Date.new(2015,01,11)), 2015
  end

  def test_grade_on_date
    assert_equal SchoolYear.grade_on_date(Date.new(2014,11,11), 2020), 7
    assert_equal SchoolYear.grade_on_date(Date.new(2015,1,11), 2020), 7
  end

  def test_default_first_day_of_school
    assert_equal SchoolYear.default_first_day_of_school(Date.new(2014,11,11)), Date.new(2014,9,01)
    assert_equal SchoolYear.default_first_day_of_school(Date.new(2015,01,11)), Date.new(2014,9,01)
  end

  def test_default_last_day_of_school
    assert_equal SchoolYear.default_last_day_of_school(Date.new(2014,11,11)), Date.new(2015,6,15)
    assert_equal SchoolYear.default_last_day_of_school(Date.new(2015,01,11)), Date.new(2015,6,15)
  end

  def test_school_days_elapsed
    assert_equal SchoolYear.school_days_elapsed(Date.new(2014,11,11)), (30 + 31 + 11 - 1) * 5 / 7.0
    assert_equal SchoolYear.school_days_elapsed(Date.new(2014,11,11), Date.new(2014,8,15)), ((31 - 15) + 30 + 31 + 11) * 5 / 7.0
    assert_equal SchoolYear.school_days_elapsed, (30 + 31 + 30 + 31 + 31 + 28 + 31 + 30 + 31 + 15 - 1) * 5 / 7.0
  end
end
