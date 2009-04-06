require File.dirname(__FILE__) + '/../spec_helper'

describe ArchiveQuarterIndexPage do
  scenario :archive
  
  before :each do
    @page = pages(:quarter_index)
  end
  
  it "should be virtual" do
    @page.should be_virtual
  end

  it "should render the <r:archive:children:each /> tag" do
    @page.should render('<r:archive:children:each><r:slug /> </r:archive:children:each>').as('article-4 ').on('/archive/2003/Q2')
  end
  
  it "should render the <r:title /> tag with interpolated date" do
    @page.should render('<r:title />').as('1st Quarter 2000 Archive').on('/archive/2000/Q1')
    @page.should render('<r:title />').as('2nd Quarter 2000 Archive').on('/archive/2000/Q2/')
    @page.should render('<r:title />').as('3rd Quarter 2000 Archive').on('/archive/2000/Q3')
    @page.should render('<r:title />').as('4th Quarter 2000 Archive').on('/archive/2000/Q4/')
  end
  
end
