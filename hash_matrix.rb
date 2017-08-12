#! /usr/bin/ruby -w
# Use hash table to save sparse matrix

# Hash key: symbol(:line_column), position of matrix node
# Hash value: value of matrix node
class Hash_Matrix
    attr_reader(:node_cnt);     # total count of the nodes

    def initialize()
        @node_cnt = 0;
        @hash_table = Hash.new();   # setup empty hash
    end

    # Create a symbol by the line and column
    def create_sym_pos(line, column)
        (line.to_s + "_" + column.to_s).to_sym;
    end

    # Search in the hash table by the position
    # Return value if existed. Else, nil.
    def search_node(line, column)
        key = create_sym_pos(line, column);
        return @hash_table[key];
    end

    # Add a node to matrix
    # If not existed, add a note to the matrix
    # Else, refresh the value in the corresponding node
    def add_note(line, column, value)
        key = create_sym_pos(line, column);
        @hash_table[key] = value;
        @node_cnt += 1;
    end

    # Delete a node from matrix
    # If not existed, return false
    # Else, delete the [key, value] and return true
    def delete_node(line, column)
        key = create_sym_pos(line, column);
        if(@hash_table.key?(key))
            @hash_table.delete(key);
            return true;
        else
            return false;
        end
    end

    def show_all()
        @hash_table.each {|pos, value|
            print("[#{pos}] = #{value}\n");
        }
    end

end

__END__
2017.8.11
