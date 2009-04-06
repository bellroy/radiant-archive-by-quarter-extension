# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ArchiveByQuarterExtension < Radiant::Extension
  version "1.0"
  description "Extends the core Archive extension to add Quarter archives"
  url "http://github.com/tricycle/radiant-archive-by-quarter-extension"
  
  def activate
    [Date,DateTime,Time].each do |klass|
      klass.send :include, QuartersExpansionForDateStrings
    end
    ArchiveFinder; ArchivePage
    ArchiveFinder.send :extend, ArchiveQuarterFinder
    ArchivePage.send :include, ArchivePageQuarterFinder
  end
end
