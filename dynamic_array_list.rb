#! /user/bin/ruby -w
# classes for line-link-list
# ����Ruby�Ķ�ά��̬���鹹�ɵĹ�����������

class Node
    attr_accessor(:val);            # ֵ
    attr_reader(:column);           # ��λ��

    def initialize(val, row, column)
        @val = val;
        @column = column;
    end
end

class Link_List_Head
    attr_reader(:row);          # ��λ��
    attr_accessor(:link_list);  # ����

    def initialize(row)
        @row = row;
        @link_list = Array.new();
    end
end

# ��Ҫ�������������������
# �����������Ƕ�̬����
# ����ͷ�γ��ϲ㶯̬����
# �����з���Ԫ��ʱ������Ч
class Dynamic_Array_List
    attr_reader(:node_cnt);                 # �ܽڵ���

    # ��������Ч����
    def line_cnt()
        @line_head.size;
    end

    def initialize()
        @line_head = Array.new();
        @node_cnt = 0;
    end

    # ����λ���ڹ�����в��Ҷ�Ӧ�ڵ�
    # ʹ���ж�̬������в���
    # ���ҳɹ������ض�Ӧ�ڵ�
    # ����ʧ�ܣ�����nil
    def search_node(row, column)
        result_node = nil;
        @line_head.each {|line_list|
            if(line_list.row == row)    # ���ڶ�Ӧ��
                line_list.link_list.each {|node|
                    if(node.column == column)   # ���ڶ�Ӧ�ڵ�
                        result_node = node;
                        break;
                    elsif(node.column > column) # �����ڶ�Ӧ�ڵ�
                        break;
                    end
                }
                break;
            elsif(line_list.pos > row)  # �����ڶ�Ӧ��
                break;
            end
        }
        return result_node;
    end

    # ����ڵ㵽�������
    # �����Ӧλ�����нڵ㣬���½ڵ㴦��ֵ
    # ����б����ڻ�Ϊ�գ������µ��ж�̬����
    def add_node(val, row, column)
        inserted = false;
        @line_head.size.times {|i|
            if(@line_head[i].row == row)    # ���ڶ�Ӧ��
                @line_head[i].link_list.size.times {|j|
                    if(@line_head[i].link_list[j].column == column)
                        # ���ڶ�Ӧ�ڵ㣬������ֵ
                        @line_head[i].link_list[j].val = val;
                        inserted = true;
                        break;
                    elsif(@line_head[i].link_list[j].column > column)
                        # �����ڶ�Ӧ�ڵ�
                        # ����������ڵ�
                        @line_head[i].link_list[j, 0] = Node.new(val, row, column);
                        inserted = true;
                        @node_cnt += 1;
                        break;
                    end
                }
                if(!inserted)
                    # ��β������ڵ�
                    @line_head[i].link_list << Node.new(val, row, column);
                    inserted = true;
                    @node_cnt += 1;
                end
                break;
            elsif(@line_head[i].row > row)  # �����ڶ�Ӧ��
                # �����������Ӧ��
                @line_head[i, 0] = Link_List_Head.new(row);
                @line_head[i].link_list << Node.new(val, row, column);
                inserted = true;
                @node_cnt += 1;
                break;
            end
        }
        if(!inserted)
            # ���ϲ�����ĵ�β��������
            @line_head << Link_List_Head.new(row);
            @line_head[i].link_list << Node.new(val, row, column);
            inserted = true;
            @node_cnt += 1;
        end
        return inserted;
    end

end

__END__
2017.8.1
