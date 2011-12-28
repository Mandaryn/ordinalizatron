require 'spec_helper'
require 'support/will_paginate/post'

describe Ordinalize do
  before(:all) do
    setup_database
    i = 0
    10.times { Post.create(value: "name#{i+=1}") }
  end

  after(:all) do
    cleanup_database
  end

  describe "will_paginate array" do
    let(:array) { Post.paginate(page: 2, per_page: 3) }
    it "should add proper ordinal numbers to all elements" do
      ordinals = [4,5,6]
      array.each_with_ordinal_number do |element, ordinal_number|
        ordinal_number.should == ordinals.shift
      end
    end

    it "should not mess with original elements" do
      ordinals = [4,5,6]
      array.each_with_ordinal_number do |element, ordinal_number|
        element.value.should == "name#{ordinals.shift}"
      end
    end
  end
end
