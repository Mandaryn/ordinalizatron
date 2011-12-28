require 'spec_helper'

describe Ordinalize do
  describe "array" do
    let(:array) { ['dupa', nil, 1, Object.new] }
    it "should add proper ordinal numbers" do
      ordinals = (1..4).to_a
      array.each_with_ordinal_number do |element, ordinal_number|
        ordinal_number.should == ordinals.shift
      end
    end

    it "should not mess with the array elements" do
      dup = array.clone
      array.each_with_ordinal_number do |element, ordinal_number|
        element.should == dup.shift
      end
    end

    it "should properly apply ordinal offset" do
      ordinals = (5..8).to_a
      array.each_with_ordinal_number(offset: 4) do |element, ordinal_number|
        ordinal_number.should == ordinals.shift
      end
    end

    it "should try guessing the offset from predefined array methods (will_paginate integration)" do
      ordinals = (4..7).to_a
      array.stub(:offset).and_return(3)
      array.each_with_ordinal_number do |element, ordinal_number|
        ordinal_number.should == ordinals.shift
      end
    end
  end
end
