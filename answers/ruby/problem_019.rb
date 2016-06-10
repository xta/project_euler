# Counting Sundays

# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.

# Thirty days has September,
# April, June and November.

# All the rest have thirty-one,

# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

class Year

  def initialize(year)
    @year = year
  end

  def total_days
    1.upto(12).map do |month|
      Month.new(month, @year).total_days
    end.reduce(0, :+)
  end

end

class Month

  def initialize(month, year)
    @month = month
    @year = year
  end

  def total_days
    case @month
    when 4, 6, 9, 11
      30
    when 2
      leap_year? ? 29 : 28
    else
      31
    end
  end

  private

  def leap_year?
    is_century = @year % 100 == 0
    divisible_by_four = @year % 4 == 0

    if is_century
      @year % 400 == 0
    else
      divisible_by_four
    end
  end

end

# 1/1/1900 Monday
# thus (+7) to get to next
# 1/8/1900 Monday, etc

# first Sunday = Jan 7, 1900

# date_id of 1 = 1/1/1900
# date_id of 7 = 1/7/1900
# etc

first_sunday = 7

# number of days from 1/1/1900 to 12/31/2000
max_date_id = 1900.upto(2000).map do |year|
  Year.new(year).total_days
end.reduce(0, :+)

# puts max_date_id #=> 36890

all_sundays             = (first_sunday...max_date_id).step(7).to_a
date_id_counter         = 0
sundays_in_first_month  = []

1900.upto(2000).each do |year|
  1.upto(12).each do |month|
    current_month = Month.new(month, year)

    if year != 1900
      first_day = date_id_counter+1

      if all_sundays.include?(first_day)
        sundays_in_first_month << first_day
      end
    end

    date_id_counter += current_month.total_days
  end
end

puts sundays_in_first_month.count #=> 171
