class ArchiveQuarterIndexPage < Page
  
  description %{
    To create a quarterly index for an archive, create a child page for the
    archive and assign the "Archive Quarter Index" page type to it.
    
    A quarterly index page makes following tags available to you:
    
    <r:archive:children>...</r:archive:children>
      Grants access to a subset of the children of the archive page
      that match the specific quarter which the index page is rendering.
  }
  
  include ArchiveIndexTagsAndMethods
  desc %{
      Grants access to a subset of the children of the archive page
      that match the specific quarter which the index page is rendering.
      
      *Usage*:
       <pre><code><r:archive:children>...</r:archive:children></code></pre>
  }
  tag "archive:children" do |tag|
    setup_date_parts
    tag.locals.children = ArchiveFinder.quarter_finder(parent.children, @year, @quarter)
    tag.expand
  end
  
  tag "title" do |tag|
    setup_date_parts
    page = tag.locals.page
    
    unless @year.nil?
      Date.new(@year.to_i, (@quarter.to_i*3), 1).strftime(page.title)
    else
      page.title
    end
  end
  
  private
    def setup_date_parts
      @year, @quarter = $1, $2 if request_uri =~ %r{/(\d{4})/[Qq](\d)/?$}
    end
    
end