#! /user/bin/ruby -w
# classes for cross-link-list

class Node
    attr_accessor(:val);            # 值
    attr_reader(:row, :column);     # 位置
    attr_accessor(:right, :down);   # 分别指向行链表和列链表的下一个节点

    def initialize(val, row, column, right = nil, down = nil)
        @val = val;
        @row = row;
        @column = column;
        @right = right;
        @down = down;
    end
end

class Link_List_Head
    attr_reader(:pos);          # 行或列
    attr_accessor(:next_list);  # 指向下一个链表头
    attr_accessor(:first_node); # 指向链表中的第一个节点

    def initialize(pos, next_list = nil, first_node = nil)
        @pos = pos;
        @next_list = next_list;
        @first_node = first_node;
    end
end

class Cross_Link_List
    attr_reader(:line_cnt, :column_cnt);    # 总行数和总列数
    attr_reader(:node_cnt);                 # 总节点数

    def initialize()
        @line_cnt = 0;
        @column_cnt = 0;
        @node_cnt = 0;
        @first_line = nil;                  # 指向首个非空行链表
        @first_column = nil;                # 指向首个非空列链表
    end

    # 插入节点到十字链表中
    # 如果对应位置已有节点，更新节点处数值
    def add_node(new_node)
    end
end

__END__
2017.8.1
