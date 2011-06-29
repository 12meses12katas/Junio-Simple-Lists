require "rspec"
require 'simplelists.rb'

describe SingleLinkedList do

  context "cases with 0 or 1 element lists" do

    it "shouldn't find any element in an empty list" do
      subject.find("fred").should be_nil
    end

    it "should find an element in the list if it exists" do
      subject.add("fred")
      subject.find("fred").value.should eq("fred")
    end

    it "shouldn't find an element in a list if it doesn't exist" do
      subject.add("fred")
      subject.find("wilma").should be_nil
    end

  end

end