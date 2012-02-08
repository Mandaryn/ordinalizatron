require "ordinalizatron/version"

module Ordinalizatron
  def each_with_ordinal_number(options = {}, &block)
    options.reverse_merge!(offset: find_offset)
    self.each_with_index do |element, index|
      yield(element, options[:offset] + index + 1)
    end
  end

  private
  #gets the offset from WillPaginate if present
  def find_offset
    return self.offset if self.respond_to? :offset #detect WillPaginate
    return 0
  end
end

Array.send(:include, Ordinalizatron)
