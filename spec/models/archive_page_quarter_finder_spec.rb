require File.dirname(__FILE__) + '/../spec_helper'

describe "ArchivePageQuarterFinder" do
  describe "quarters url scheme" do
    before(:each) do
      @page = ArchivePage.new
      @page.stub!(:url).and_return("/archive/")
      @page.stub!(:children).and_return(mock("ArchiveQuarterPage", :find_by_class_name => :our_page, :null_object => true))
    end

    it "should find page if matches" do
      @page.find_by_url("/archive/2009/Q3").should == :our_page
    end

    it "should not find if does not match" do
      @page.find_by_url("/archive/2009/something_else").should_not == :our_page
    end
  end
end
