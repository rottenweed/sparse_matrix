#! /user/bin/ruby -w
# coding: utf-8
#
# classes for line-link-list
# 利用Ruby的二维动态数组构成的广义表替代链表


# 不要求点阵的行数和列数相等
# 单个行链表是动态数组
# 链表头形成上层动态数组
# 行中有非零元素时，行有效
class Dynamic_Array_List
    attr_reader(:node_cnt);             # 总节点数

    # 节点定义
    class Node
        attr_accessor(:val);            # 值
        attr_reader(:column);           # 列位置

        def initialize(column, val = 0)
            @val = val;
            @column = column;
        end
    end

    # 行链表头定义
    class Link_List_Head
        attr_reader(:row);              # 行位置
        attr_accessor(:link_list);      # 链表

        def initialize(row)
            @row = row;
            @link_list = [];
        end
    end

    # 返回总有效行数
    def line_cnt()
        @line_head.size;
    end

    def initialize()
        @line_head = [];
        @node_cnt = 0;      # 节点总数
        @i = 0;             # 实际行存储位置
        @j = nil;           # 实际列存储位置
    end

    # 根据位置在广义表中查找对应节点
    # 使用行动态数组进行查找
    # 查找成功：返回对应节点，并保存数组位置到内部变量
    # 查找失败：返回nil，并保存待插入数组位置
    def search_node(row, column)
        result_node = nil;
        # 预置行位置为行尾，且行不存在
        @i = @line_head.size;
        @j = nil;
        @line_head.size.times {|i|
            line_list = @line_head[i];
            if(line_list.row == row)    # 存在对应行
                # 预置列位置为本行行尾
                @i = i;
                @j = line_list.link_list.size;
                line_list.link_list.size.times {|j|
                    node = @line_head[i].link_list[j];
                    if(node.column == column)   # 存在对应节点
                        result_node = node;
                        @i, @j = i, j;  # 暂存实际储存位置
                        break;
                    elsif(node.column > column) # 不存在对应节点
                        @i, @j = i, j;
                        break;
                    end
                }
                break;
            elsif(line_list.row > row)  # 不存在对应行
                @i, @j = i, nil;        # @j = nil标志该行不存在
                break;
            end
        }
        return result_node;
    end

    # 插入节点到广义表中
    # 如果对应位置已有节点，更新节点处数值
    # 如果行表不存在或为空，创建新的行动态数组
    def add_node(row, column, val)
        # 搜索对应节点
        node_existed = search_node(row, column);
        if(node_existed)
            # 节点已经存在，更新值
            @line_head[@i].link_list[@j].val = val;
        else
            # 创建节点
            node = Node.new(column, val);
            if(@j == nil)   # 行不存在
                # 创建并插入对应行
                @line_head[@i, 0] = Link_List_Head.new(row);
                @line_head[@i].link_list << node;
            else            # 行已经存在
                # 在行中插入节点
                @line_head[@i].link_list[@j, 0] = node;
            end
            @node_cnt += 1;
        end
    end

    # 显示所有非零的节点
    def show_all()
        if(@line_head.empty?)
            print("There is no un_zero nodes.\n");
        else
            @line_head.each {|line|
                print("Row: #{line.row}\n");
                line.link_list.each {|node|
                    print("  Column #{node.column}: #{node.val}\n");
                }
            }
        end
    end

    # 删除对应节点
    # 如果原节点不存在，返回false
    # 如果节点存在，返回true
    def delete_node(row, column)
        if(search_node(row, column) == nil)
            return false;
        else
            # 从行中删除节点
            @line_head[@i].link_list[@j, 1] = [];
            @node_cnt -= 1;
            # 如果所在行成为空行，删除该行
            if(@line_head[@i].link_list.empty?)
                @line_head[@i, 1] = [];
            end
            return true;
        end
    end

end

__END__
2017.8.1
