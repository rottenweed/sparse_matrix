#! /user/bin/ruby -w
#
# classes of cross-link-list for sparse matrix
# only no-zero nodes are stored in the links
# only real lines(having no-zero node) are stored in the links

class Cross_Link_List

    # build-in class for node
    class Node
        attr_accessor(:val);            # value
        attr_reader(:line, :column);    # position
        attr_accessor(:right, :down);   # point to the next node in line/column

        def initialize(line, column, val, right = nil, down = nil)
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

        # iterator in line
        def each_in_line()
            if(block_given?)
                node = @first_node;
                while(node != nil)
                    yield node;
                    node = node.right;
                end
            end
        end

        # iterator in column
        def each_in_column()
            if(block_given?)
                node = @first_node;
                while(node != nil)
                    yield node;
                    node = node.down;
                end
            end
        end

    end

    attr_reader(:line_cnt, :column_cnt);    # total count of line/column
    attr_reader(:node_cnt);                 # total count of nodes

    def initialize()
        @line_cnt = 0;                      # the max line
        @column_cnt = 0;                    # the max column
        @active_line_cnt = 0;               # of no-zero nodes
        @active_column_cnt = 0;             # of no-zero nodes
        @node_cnt = 0;
        @first_line = nil;                  # point to the first line list
        @first_column = nil;                # point to the first column list
        # The following 4 vars save the search position
        # If the search success, the positions sign the node
        # If failed, the positions show the insert positions (pre- link-list or node)
        @cur_line_head = nil;   # position in line-head link-list
        @cur_column_head = nil; # position in column-head link-list
        @cur_line_node = nil;   # position in line link-list
        @cur_column_node = nil; # position in column link-list
    end

    # Search the node through line link-list
    # If node exists, return the node
    # Else, return nil
    def search_node_by_line(line, column)
        node = nil;
        line_head = @first_line;
        # initialize the search posiitons
        @cur_line_head = nil;
        @cur_line_node = nil;
        while(line_head)
            if(line_head.pos == line)   # the line existed
                @cur_line_head = line_head;
                # start to search node in line
                line_node = line_head.first_node;
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
                end
                break;
            elsif(line_head.pos > line) # the line not existed
                break;  # @cur_line_head save the last link-list
            else    # pos < line, to next line
                @cur_line_head = line_head;
                line_head = line_head.next_list;
            end
        end
        return node;
    end

    # Insert node to the cross link list
    # If there is node already, refresh the value
    def add_node(line, column, val)
        node = search_node_by_line(line, column);
        if(node != nil)     # search success, reflesh the value
            node.val = val;
        else    # node not exist, insert it
            @node_cnt += 1;
            if(@cur_line_head == nil)   # should be the first line link-list
                # create line link-list as the first line, and create node as its first node
                @active_line_cnt += 1;
                @cur_line_head = Link_List_Head.new(line);
                @cur_line_head.next_list = @first_line;
                @cur_line_node = Node.new(line, column, val);
                @cur_line_head.first_node = @cur_line_node;
                @first_line = @cur_line_head;
            elsif(@cur_line_head.pos < line)    # a new line should be insert in the middle
                # create new line, insert it to line-head link-list
                @active_line_cnt += 1;
                temp = @cur_line_head.next_list;
                @cur_line_head.next_list = Link_List_Head.new(line);
                @cur_line_head = @cur_line_head.next_list;
                @cur_line_head.next_list = temp;
                @cur_line_node = Node.new(line, column, val);
                @cur_line_head.first_node = @cur_line_node;
            else    # the line existed, insert node in this line
                if(@cur_line_node == nil) # should be the first node in the line
                    @cur_line_node = Node.new(line, column, val);
                    @cur_line_node.next = @cur_line_head.first_node;
                    @cur_line_head.first_node = @cur_line_node;
                else    # a new node shoulde be insert in the line
                    temp = @cur_line_node.next;
                    @cur_line_node.next = Node.new(line, column, val);
                    @cur_line_node = @cur_line_node.next;
                    @cur_line_node.next = temp;
                end
            end
        end
    end

    # iterator for cross_link_list scan at line sequence
    def each_line()
        if(block_given?)
            cur_line = @first_line;
            while(cur_line != nil)
                yield cur_line;
                cur_line = cur_line.next_list;
            end
        end
    end

    # Show all the nodes in the cross link-list
    # according to the line sequence at first, then column sequence
    def show_all()
        print("Total count of nodes: #{@node_cnt}\n");
        self.each_line {|cur_line|
            print("line #{cur_line.pos}:\n");
            cur_line.each_in_line {|node|
                print("  [#{node.line}, #{node.column}] = #{node.val}\n");
            }
        }
    end
    
end

__END__
2017.8.1
