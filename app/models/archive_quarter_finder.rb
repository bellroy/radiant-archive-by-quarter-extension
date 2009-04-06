module ArchiveQuarterFinder
  def quarter_finder(finder, year, quarter) 
    months = { 1 => 1, 2 => 4, 3 => 7, 4 => 10 }
    new do |method, options|
      start = Time.local(year, months[quarter.to_i])
      finish = start.next_month.next_month.next_month
      add_condition(options, "published_at >= ? and published_at < ?", start, finish)
      finder.find(method, options)
    end
  end
end
