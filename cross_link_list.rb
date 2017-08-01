#! /user/bin/ruby -w
# classes for cross-link-list

class Node
    attr_accessor(:val);
    attr_reader(:row, :column);
    attr_accessor(:right, :down);

    def initialize(val, row, column, right = nil, down = nil)
        @val = val;
        @row = row;
        @column = column;
        @right = right;
        @down = down;
    end
end

__END__
2017.8.1
