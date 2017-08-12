#! /user/bin/ruby -w
#
# classes of cross-link-list for sparse matrix

class Cross_Link_List

    # build-in class for node
    class Node
        attr_accessor(:val);            # value
        attr_reader(:line, :column);    # position
        attr_accessor(:right, :down);   # point to the next node in line/column

        def initialize(val, line, column, right = nil, down = nil)
            @val = val;
            @line = line;
            @column = column;
            @right = right;
            @down = down;
        end
    end

    # bulid-in class for link-list head of line/column
    class Link_List_Head
        attr_reader(:pos);          # line or column of the list
        attr_accessor(:next_list);  # point to the next line/column list
        attr_accessor(:first_node); # point to the first node in the list

        def initialize(pos, next_list = nil, first_node = nil)
            @pos = pos;
            @next_list = next_list;
            @first_node = first_node;
        end
    end

    attr_reader(:line_cnt, :column_cnt);    # total count of line/column
    attr_reader(:node_cnt);                 # total count of nodes

    def initialize()
        @line_cnt = 0;
        @column_cnt = 0;
        @node_cnt = 0;
        @first_line = nil;                  # point to the first line list
        @first_column = nil;                # point to the first column list
        # The following 4 vars save the search position
        # If the search success, the positions sign the node
        # If failed, the positions show the insert positions (pre- link-list or node)
        @cur_line_header = nil;             # position in line-head link-list
        @cur_column_header = nil;           # position in column-head link-list
        @cur_line_node = nil;               # position in line link-list
        @cur_column_node = nil;             # position in column link-list
    end

    # Search the node through line link-list
    # If node exists, return the node
    # Else, return nil
    def search_node_by_line(line, column)
        node = nil;
        line_header = @first_line;
        # initialize the search posiitons
        @cur_line_header = nil;
        @cur_line_node = nil;
        while(line_header)
            if(line_header.pos == line)     # the line existed
                @cur_line_head = line_header;
                # start to search node in line
                line_node = line_header.first_node;
                while(line_node)
                    if(line_node.column == column)  # search the node
                        node = line_node;
                        @cur_line_node = line_node;
                        break;
                    elsif(line_node.column > column)    # search fail
                        break;  # @cur_line_node save the last node
                    else    # node_column < column, to next node
                        @cur_line_node = line_node;
                        line_node = line.node.right;
                end
                break;
            elsif(line_header.pos > line)   # the line not existed
                break;                      # @cur_line_head save the last link-list
            else    # pos < line, to next line
                @cur_line_head = line_header;
                line_header = line_header.next_line;
            end
        end
        return node;
    end

    # Insert node to the cross link list
    # If there is node already, refresh the value
    def add_node(line, column, val)
    end
end

__END__
2017.8.1
