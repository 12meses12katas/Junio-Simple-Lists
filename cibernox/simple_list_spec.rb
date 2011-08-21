require 'rspec'
require './simple_lists.rb'

shared_examples "a list" do

  context "just instantiated" do
    let(:list) { described_class.new }

    it { list.should be_empty }
    it { list.should have(0).values }

    it "should not find 'fred'" do
      list.find('fred').should be_nil
      list.include?('fred').should be_false
    end

    it "should return nil if we try to delete a node(since it does not exist)" do
      list.delete(list.find("fred")).should be_nil
    end
    
    it "should be able to add 'fred'. It return a node with 'fred' as value" do
      list.add('fred').value.should eql('fred')
    end

    it "should change first and last when added the first element" do
      lambda{ list.add('fred') }.should change{ list.first }
      lambda{ list.add('wilma') }.should change{ list.last }
    end

    it "should return an empty array when we call values" do
      res = list.values
      res.should be_a(Array)
      res.should eql([])
    end

  end

  context "with 'fred' inside" do
    before do 
      @list = described_class.new
      @list.add('fred') 
    end

    it "should not find 'wilma'" do
      @list.find('wilma').should be_nil
    end

    it "should be able to find 'fred'" do
      @list.find('fred').value.should eql('fred')
      @list.include?('fred').should be_true
      @list.include?('wilma').should be_false
    end

    it "should return nil if we try to delete a node with 'wilma'(since it does not exist)" do
      @list.delete(@list.find("wilma")).should be_nil
    end

  end

  context "with 'fred' and 'wilma' inside" do
    before do
      @list = described_class.new
      @list.add('fred') 
      @list.add('wilma') 
    end

    it "should return ['fred','wilma'] when call values" do
      @list.values.should eql(['fred','wilma'])
    end

    it "should return a node with 'wilma' as the next of 'fred' if we add wilma just after fred" do
      @list.find('fred').sig.value.should eql('wilma')
    end

  end

  context "with 'fred', 'wilma', 'betty' and 'barney' inside" do
    before do
      @list = described_class.new
      @list.add('fred') 
      @list.add('wilma') 
      @list.add('betty') 
      @list.add('barney') 
    end
    
    it 'should return ["fred", "wilma", "betty", "barney"] when call #values' do
      @list.values.should eql(["fred", "wilma", "betty", "barney"])
    end

    it "should include 'wilma' and 'barnet'" do
      @list.include?('betty').should be_true
      @list.include?('barney').should be_true
    end

    it "should be able to delete an element by its content" do
      @list.find('fred').should_not be_nil
      @list.delete @list.find('fred')
      @list.find('fred').should be_nil
      @list.include?('fred').should be_false
    end

    it "should be able to delete an element by its content even if it has several items" do
      @list.delete @list.find('betty')
      @list.find('betty').should be_nil
      @list.include?('betty').should be_false
      @list.values.should eql(["fred","wilma","barney"])
      @list.first.value.should eql("fred")
      @list.last.value.should eql("barney")
    end

    it "should contain 'betty' in the last node after delete 'barney'" do
      @list.delete @list.find('barney')
      @list.last.value.should eql('betty')
    end

  end

end

describe SingleLinkedList do
  it_behaves_like "a list"
end

describe DoubleLinkedList do
  it_behaves_like "a list"
end