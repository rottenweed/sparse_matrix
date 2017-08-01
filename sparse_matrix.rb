#! /usr/bin/ruby -w
# use cross-link-list to store sparse matrix

require './cross_link_list.rb'

BEGIN {
    print("Test sparse matrix stored by cross-link-list\n");
}

a = Node.new(0.5, 0, 0);
print(a.val, "\n");

END {
    print("Program end.\n");
}

__END__
2017.8.1
