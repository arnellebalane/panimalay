module CalendarMagic
  class CalendarGenerator
    @month_names = %w(January February March April May June July August September October November December)

    def self.generate_month(month, year)
      date = Date.civil(year, month, 1)
      calendar = {:month => @month_names[date.month - 1], :year => date.year}
      calendar[:days] = (date.beginning_of_month..date.end_of_month).to_a
      (calendar[:days].first.cwday % 7).times { calendar[:days].unshift(nil) }
      (6 - calendar[:days].last.wday).times { calendar[:days].push(nil) }
      calendar[:previous_month] = date.prev_month.beginning_of_month
      calendar[:next_month] = date.next_month.beginning_of_month
      calendar
    end
  end
end