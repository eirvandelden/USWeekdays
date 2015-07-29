require "us_weekdays/version"

module USWeekdays
    # Parse a date into a US Standard Week Number, starting with Monday
  # Solution is based on MS.Net implementation here:
  # https://msdn.microsoft.com/en-us/library/bb277364(v=office.12).aspx#Excel2007Implementingweeknumber_ExcelWorksheetFunction
  def self.for_date(date)
    # The formula to calculate the weekday is as follows:
    # 1 + ((date - (Date.parse("2-1-#{year}") - (Date.parse("1-1-#{year}").wday + 1) )) / 7).to_i
    # It's quite difficult to understand above formula, so we'll use a lengthier
    second_of_january = Date.parse("2-1-#{date.year}")
    first_weekday_of_year = Date.parse("1-1-#{date.year}").wday + 1

    start_day_of_week_one = second_of_january - first_weekday_of_year
    days_passed_since_start_day = date - start_day_of_week_one

    weeks_passed = (days_passed_since_start_day / 7).to_i + 1

    weeks_passed
  end
end
