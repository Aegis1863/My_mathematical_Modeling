function [ fare ] = distance( coord )
    % �� �� �� �� �� �� �� �� �� �� �� �� �� ֮ �� �� �� ��
    % fare Ϊ �� �� �� �� �� �� �� coord Ϊ �� �� �� �� �� ��
    [ ~ , m ] = size( coord ) ; % m Ϊ �� �� �� �� ��
    fare = zeros( m ) ; % ����0����
    for i = 1 : m % �� �� Ϊ ��
        for j = i : m % �� �� Ϊ ��
            fare( i , j ) = ( sum( ( coord( : , i ) - coord( : , j ) ) .^ 2 ) ) ^ 0.5 ;
            fare( j , i ) = fare( i , j ) ; % �� �� �� �� �� ��
        end
    end
end
% �õ�һ�����󣬾�������ж�Ӧ��������