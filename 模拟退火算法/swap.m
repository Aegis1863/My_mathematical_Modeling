function [ newpath , position ] = swap( oldpath , number )
    % �� oldpath �� �� �� �� �� ��
    % number Ϊ �� �� �� �� · �� �� �� ��
    % position Ϊ �� Ӧ newpath �� �� �� λ ��
    m = length( oldpath ) ; % �� �� �� �� ��
    newpath = zeros( number , m ) ;
    position = sort( randi( m , number , 2 ) , 2 ); 
    % �������������λ��,sort�ڶ�����������1��������,2��������
    for i = 1 : number
        newpath( i , : ) = oldpath ;
        % �� �� · �� �� ѡ �� �� �� ��
        newpath( i , position( i , 1 ) ) = oldpath( position( i , 2 ) ) ;
        newpath( i , position( i , 2 ) ) = oldpath( position( i , 1 ) ) ;
    end
end