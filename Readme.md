Ordinalizatron
==========

Simple way to get ordinal numbers for your collections.

Example
-------

Without ordinalizatron:

    <% User.paginate(page: 5).each_with_index do |user,index| %>
        <% ordinal = get_the_offset_part_helper + 1 + index %>
        <%= "#{ordinal}. #{user.name} %>
    <% end %>

With ordinalizatron:

    <% User.paginate(page: 5).each_with_ordinal_number do |user,ordinal_number| %>
        <%= "#{ordinal_number}. #{user.name} %>
    <% end %>

Custom offset (still better than adding 1 to index and then offset):

    <% User.page(5).each_with_ordinal_number(offset: get_the_offset_part_helper) do |user,ordinal_number| %>
        <%= "#{ordinal_number}. #{user.name} %>
    <% end %>

Features
--------

Gives you easy ordinal numbers

Integrates with will_paginate

Doesn't integrate with Kaminari, but you can still use the custom offset method
