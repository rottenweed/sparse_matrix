#! /usr/bin/ruby -w
# Use hash table to save sparse matrix

# Hash key: symbol(:line_column), position of matrix node
# Hash value: value of matrix node
class Hash_Matrix
    attr_reader(:node_cnt);     # total count of the nodes

    def initiate()
        @node_cnt = 0;
        @hash_table = Hash.new();   # setup empty hash
    end

end

__END__
2017.8.11
