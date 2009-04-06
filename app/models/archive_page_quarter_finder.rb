module ArchivePageQuarterFinder
  def self.included(base)
    base.class_eval do
      alias_method_chain :find_by_url, :quarters
    end
  end

  def find_by_url_with_quarters(url, live = true, clean = false)
    url = clean_url(url) if clean
    if url =~ %r{^#{ self.url }(\d{4})(?:(?:/(\d{2})(?:/(\d{2}))?)|/([qQ]\d))?/?$}
      year, month, day, quarter = $1, $2, $3, $4
      children.find_by_class_name(
        case
        when day
          'ArchiveDayIndexPage'
        when quarter
          'ArchiveQuarterIndexPage'
        when month
          'ArchiveMonthIndexPage'
        else
          'ArchiveYearIndexPage'
        end
      )
    else
      find_by_url_without_quarters(url, live, clean)
    end
  end
end
