module QuartersExpansionForDateStrings
  def self.included(base)
    base.class_eval do
      unless instance_methods.include?("strftime_without_quarters_expansion")
        alias_method_chain :strftime, :quarters_expansion
      end
    end
  end
  
  def strftime_with_quarters_expansion(fmt='%F')
    quarter = (month-1)/3+1
    strftime_without_quarters_expansion(fmt.gsub('%q',quarter.to_s).gsub('%o',quarter.ordinalize))
  end
end
