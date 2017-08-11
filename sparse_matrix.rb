#! /usr/bin/ruby -w
# use cross-link-list to store sparse matrix

# require './cross_link_list.rb'
require './dynamic_array_list.rb'

BEGIN {
    print("Test sparse matrix stored by dynamic array list.\n");
}

mat0 = Dynamic_Array_List.new();
mat0.show_all;

mat0.add_node(0, 0, 0.6);
mat0.show_all;
mat0.add_node(0, 1, 0.4);
mat0.show_all;

print("Line count: ", mat0.line_cnt, "\n");
print("Node count: ", mat0.node_cnt, "\n");

mat0.add_node(1, 1, 1.0);
mat0.show_all;

print("Line count: ", mat0.line_cnt, "\n");
print("Node count: ", mat0.node_cnt, "\n");

if((node = mat0.search_node(1, 0)) != nil)
    print(node.val, "\n");
end
if((node = mat0.search_node(1, 1)) != nil)
    print(node.val, "\n");
end

print(mat0.delete_node(1, 0), "\n");
print(mat0.delete_node(1, 1), "\n");

print("Line count: ", mat0.line_cnt, "\n");
print("Node count: ", mat0.node_cnt, "\n");

mat0.show_all;

END {
    print("Program end.\n");
}

__END__
2017.8.1
