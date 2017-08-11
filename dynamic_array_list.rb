#! /user/bin/ruby -w
# coding: utf-8
#
# classes for line-link-list
# ����Ruby�Ķ�ά��̬���鹹�ɵĹ�����������


# ��Ҫ�������������������
# �����������Ƕ�̬����
# ����ͷ�γ��ϲ㶯̬����
# �����з���Ԫ��ʱ������Ч
class Dynamic_Array_List
    attr_reader(:node_cnt);             # �ܽڵ���

    # �ڵ㶨��
    class Node
        attr_accessor(:val);            # ֵ
        attr_reader(:column);           # ��λ��

        def initialize(column, val = 0)
            @val = val;
            @column = column;
        end
    end

    # ������ͷ����
    class Link_List_Head
        attr_reader(:row);              # ��λ��
        attr_accessor(:link_list);      # ����

        def initialize(row)
            @row = row;
            @link_list = [];
        end
    end

    # ��������Ч����
    def line_cnt()
        @line_head.size;
    end

    def initialize()
        @line_head = [];
        @node_cnt = 0;      # �ڵ�����
        @i = 0;             # ʵ���д洢λ��
        @j = nil;           # ʵ���д洢λ��
    end

    # ����λ���ڹ�����в��Ҷ�Ӧ�ڵ�
    # ʹ���ж�̬������в���
    # ���ҳɹ������ض�Ӧ�ڵ㣬����������λ�õ��ڲ�����
    # ����ʧ�ܣ�����nil�����������������λ��
    def search_node(row, column)
        result_node = nil;
        # Ԥ����λ��Ϊ��β�����в�����
        @i = @line_head.size;
        @j = nil;
        @line_head.size.times {|i|
            line_list = @line_head[i];
            if(line_list.row == row)    # ���ڶ�Ӧ��
                # Ԥ����λ��Ϊ������β
                @i = i;
                @j = line_list.link_list.size;
                line_list.link_list.size.times {|j|
                    node = @line_head[i].link_list[j];
                    if(node.column == column)   # ���ڶ�Ӧ�ڵ�
                        result_node = node;
                        @i, @j = i, j;  # �ݴ�ʵ�ʴ���λ��
                        break;
                    elsif(node.column > column) # �����ڶ�Ӧ�ڵ�
                        @i, @j = i, j;
                        break;
                    end
                }
                break;
            elsif(line_list.row > row)  # �����ڶ�Ӧ��
                @i, @j = i, nil;        # @j = nil��־���в�����
                break;
            end
        }
        return result_node;
    end

    # ����ڵ㵽�������
    # �����Ӧλ�����нڵ㣬���½ڵ㴦��ֵ
    # ����б����ڻ�Ϊ�գ������µ��ж�̬����
    def add_node(row, column, val)
        # ������Ӧ�ڵ�
        node_existed = search_node(row, column);
        if(node_existed)
            # �ڵ��Ѿ����ڣ�����ֵ
            @line_head[@i].link_list[@j].val = val;
        else
            # �����ڵ�
            node = Node.new(column, val);
            if(@j == nil)   # �в�����
                # �����������Ӧ��
                @line_head[@i, 0] = Link_List_Head.new(row);
                @line_head[@i].link_list << node;
            else            # ���Ѿ�����
                # �����в���ڵ�
                @line_head[@i].link_list[@j, 0] = node;
            end
            @node_cnt += 1;
        end
    end

    # ��ʾ���з���Ľڵ�
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

    # ɾ����Ӧ�ڵ�
    # ���ԭ�ڵ㲻���ڣ�����false
    # ����ڵ���ڣ�����true
    def delete_node(row, column)
        if(search_node(row, column) == nil)
            return false;
        else
            # ������ɾ���ڵ�
            @line_head[@i].link_list[@j, 1] = [];
            @node_cnt -= 1;
            # ��������г�Ϊ���У�ɾ������
            if(@line_head[@i].link_list.empty?)
                @line_head[@i, 1] = [];
            end
            return true;
        end
    end

end

__END__
2017.8.1
