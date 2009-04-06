require File.dirname(__FILE__) + '/../spec_helper'

describe 'Extensions to Date, DateTime, Time to give quarter expansion' do
  
  it "should expand %q as the year's quarter" do
    Date.new(2008,1,3).strftime('%q').should == '1'
    Date.new(2008,4,3).strftime('%q').should == '2'
    Date.new(2008,7,3).strftime('%q').should == '3'
    Date.new(2008,11,3).strftime('%q').should == '4'
  end
  
  it "should expand %o as an ordinalized form of the year's quarter" do
    Date.new(2008,1,3).strftime('%o').should == '1st'
    Date.new(2008,6,3).strftime('%o').should == '2nd'
    Date.new(2008,8,3).strftime('%o').should == '3rd'
    Date.new(2008,10,3).strftime('%o').should == '4th'
  end
  
end