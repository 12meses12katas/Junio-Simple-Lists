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

  it "should find the 2 elements if added to the list" do
    subject.add("fred")
    subject.add("wilma")
    subject.find("fred").value.should eq("fred")
    subject.find("wilma").value.should eq("wilma")
    subject.values.should eq(["fred", "wilma"])
  end

  it "should find the 4 elements if added to the list" do
    subject.add("fred")
    subject.add("wilma")
    subject.add("betty")
    subject.add("barney")
    subject.values.should eq(["fred", "wilma", "betty", "barney"])
  end

  it "deleting elements should make them go out from the list" do
    subject.add("fred")
    subject.add("wilma")
    subject.add("betty")
    subject.add("barney")
    subject.delete(subject.find("wilma"))
    subject.values.should eq(["fred", "betty", "barney"])
    subject.delete(subject.find("barney"))
    subject.values.should eq(["fred", "betty"])
    subject.delete(subject.find("fred"))
    subject.values.should eq(["betty"])
    subject.delete(subject.find("betty"))
    subject.values.should eq([])
  end

end