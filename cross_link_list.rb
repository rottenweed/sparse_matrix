#! /user/bin/ruby -w
# classes for line-link-list
# ����Ruby��̬�����γɹ�����������

class Node
    attr_accessor(:val);            # ֵ
    attr_reader(:row, :column);     # λ��

    def initialize(val, row, column)
        @val = val;
        @row = row;
        @column = column;
    end
end

class Link_List_Head
    attr_reader(:pos);          # �л���λ��
    attr_accessor(:link_list);  # ����

    def initialize(pos)
        @pos = pos;
        @link_list = Array.new();
    end
end

# ��Ҫ�������������������
# �����������Ƕ�̬����
# ����ͷ�γ��ϲ㶯̬����
# �����з���Ԫ��ʱ������Ч
class Cross_Link_List
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
            if(line_list.pos == row)    # ���ڶ�Ӧ��
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
            if(@line_head[i].pos == row)    # ���ڶ�Ӧ��
                @line_head[i].link_list.each {|node|
                    if(node.column == column)   # ���ڶ�Ӧ�ڵ�
                        node.val = val;
                        break;
                    elsif(node.column > column) # �����ڶ�Ӧ�ڵ�
                        break;
                    end
                }
            end
        }
    end

end

__END__
2017.8.1
