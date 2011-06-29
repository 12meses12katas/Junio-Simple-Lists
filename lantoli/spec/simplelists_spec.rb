require "rspec"
require 'simplelists.rb'

describe SingleLinkedList do

  it "shouldn't find strings not in the list" do
    subject.find("fred").should be_nil
  end

  it "should find element in the list if it exists" do
    subject.add("fred")
    subject.find("fred").value.should eq("fred")
  end

end