#! /user/bin/ruby -w
# classes for cross-link-list
# ����Ruby��̬�����������

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
# ������������������Ƕ�̬����
# ����ͷ�γɶ�̬����
# �У��У����з���Ԫ��ʱ���У��У���Ч
class Cross_Link_List
    attr_reader(:node_cnt);                 # �ܽڵ���

    # ��������Ч����
    def line_cnt()
        @line_head.size;
    end

    # ��������Ч����
    def column_cnt()
        @column_head.size;
    end

    def initialize()
        @line_head = Array.new();
        @column_head = Array.new();
        @node_cnt = 0;
    end

    # ����λ����ʮ�������в��Ҷ�Ӧ�ڵ�
    # ʹ����������в���
    # ���ҳɹ������ض�Ӧ�ڵ�
    # ����ʧ�ܣ�����nil
    def search_node(row, column)
        i = 0;
    end

    # ����ڵ㵽ʮ��������
    # �����Ӧλ�����нڵ㣬���½ڵ㴦��ֵ
    # �������������������ڻ�Ϊ�գ���������
    # �Ȳ����������ٲ���������
    def add_node(val, row, column)
    end

end

__END__
2017.8.1
