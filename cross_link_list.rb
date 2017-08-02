#! /user/bin/ruby -w
# classes for line-link-list
# 利用Ruby动态数组形成广义表替代链表

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
# 单个行链表是动态数组
# 链表头形成上层动态数组
# 行中有非零元素时，行有效
class Cross_Link_List
    attr_reader(:node_cnt);                 # 总节点数

    # 返回总有效行数
    def line_cnt()
        @line_head.size;
    end

    def initialize()
        @line_head = Array.new();
        @node_cnt = 0;
    end

    # 根据位置在广义表中查找对应节点
    # 使用行动态数组进行查找
    # 查找成功：返回对应节点
    # 查找失败：返回nil
    def search_node(row, column)
        result_node = nil;
        @line_head.each {|line_list|
            if(line_list.pos == row)    # 存在对应行
                line_list.link_list.each {|node|
                    if(node.column == column)   # 存在对应节点
                        result_node = node;
                        break;
                    elsif(node.column > column) # 不存在对应节点
                        break;
                    end
                }
                break;
            elsif(line_list.pos > row)  # 不存在对应行
                break;
            end
        }
        return result_node;
    end

    # 插入节点到广义表中
    # 如果对应位置已有节点，更新节点处数值
    # 如果行表不存在或为空，创建新的行动态数组
    def add_node(val, row, column)
        inserted = false;
        @line_head.size.times {|i|
            if(@line_head[i].pos == row)    # 存在对应行
                @line_head[i].link_list.each {|node|
                    if(node.column == column)   # 存在对应节点
                        node.val = val;
                        break;
                    elsif(node.column > column) # 不存在对应节点
                        break;
                    end
                }
            end
        }
    end

end

__END__
2017.8.1
