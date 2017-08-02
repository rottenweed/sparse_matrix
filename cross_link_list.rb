#! /user/bin/ruby -w
# classes for cross-link-list
# 利用Ruby动态数组替代链表

class Node
    attr_accessor(:val);            # 值
    attr_reader(:row, :column);     # 位置

    def initialize(val, row, column)
        @val = val;
        @row = row;
        @column = column;
    end
end

class Link_List_Head
    attr_reader(:pos);          # 行或列位置
    attr_accessor(:link_list);  # 链表

    def initialize(pos)
        @pos = pos;
        @link_list = Array.new();
    end
end

# 不要求点阵的行数和列数相等
# 单个行链表和列链表都是动态数组
# 链表头形成动态数组
# 行（列）中有非零元素时，行（列）有效
class Cross_Link_List
    attr_reader(:node_cnt);                 # 总节点数

    # 返回总有效行数
    def line_cnt()
        @line_head.size;
    end

    # 返回总有效列数
    def column_cnt()
        @column_head.size;
    end

    def initialize()
        @line_head = Array.new();
        @column_head = Array.new();
        @node_cnt = 0;
    end

    # 根据位置在十字链表中查找对应节点
    # 使用行链表进行查找
    # 查找成功：返回对应节点
    # 查找失败：返回nil
    def search_node(row, column)
        i = 0;
    end

    # 插入节点到十字链表中
    # 如果对应位置已有节点，更新节点处数值
    # 如果行链表或列链表不存在或为空，创建链表
    # 先插入行链表，再插入列链表
    def add_node(val, row, column)
    end

end

__END__
2017.8.1
