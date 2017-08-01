#! /user/bin/ruby -w
# classes for cross-link-list

class Node
    attr_accessor(:val);            # ֵ
    attr_reader(:row, :column);     # λ��
    attr_accessor(:right, :down);   # �ֱ�ָ������������������һ���ڵ�

    def initialize(val, row, column, right = nil, down = nil)
        @val = val;
        @row = row;
        @column = column;
        @right = right;
        @down = down;
    end
end

class Link_List_Head
    attr_reader(:pos);          # �л���
    attr_accessor(:next_list);  # ָ����һ������ͷ
    attr_accessor(:first_node); # ָ�������еĵ�һ���ڵ�

    def initialize(pos, next_list = nil, first_node = nil)
        @pos = pos;
        @next_list = next_list;
        @first_node = first_node;
    end
end

class Cross_Link_List
    attr_reader(:line_cnt, :column_cnt);    # ��������������
    attr_reader(:node_cnt);                 # �ܽڵ���

    def initialize()
        @line_cnt = 0;
        @column_cnt = 0;
        @node_cnt = 0;
        @first_line = nil;                  # ָ���׸��ǿ�������
        @first_column = nil;                # ָ���׸��ǿ�������
    end

    # ����ڵ㵽ʮ��������
    # �����Ӧλ�����нڵ㣬���½ڵ㴦��ֵ
    def add_node(new_node)
    end
end

__END__
2017.8.1
