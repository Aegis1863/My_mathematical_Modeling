function [ ] = myplot( path , coord , pathfar )
    % 做 出 路 径 的 图 形
    % path 为 要 做 图 的 路 径 ，coord 为 各 个 城 市 的 坐 标
    % pathfar 为 路 径 path 对 应 的 费 用
    len = length( path ) ;  %路径数量
    clf ;
    hold on ;
    title( [ '近似最短路径如下，路程为' , num2str( pathfar ) ] ) ;
    plot( coord( 1 , : ) , coord( 2 , : ) , 'ok');
    xlabel('经度')
    ylabel('纬度')
    pause( 0.4 ) ;
    for ii = 2 : len
        plot( coord( 1 , path( [ ii - 1 , ii ] ) ) , coord( 2 , path( [ ii - 1 , ii ] ) ) , '-b');
        x = sum( coord( 1 , path( [ ii - 1 , ii ] ) ) ) / 2 ;
        y = sum( coord( 2 , path( [ ii - 1 , ii ] ) ) ) / 2 ;
        text( x , y , [ '(' , num2str( ii - 1 ) , ')' ] ) ;  %在线旁边写文本，此处表示第几条路径
        pause( 0.01 ) ;  %作图时间间隔，注释掉可取消动态显示，节省时间
    end
    plot( coord( 1 , path( [ 1 , len ] ) ) , coord( 2 , path( [ 1 , len ] ) ) , '-b' ) ;   %链接最后一条路径
    x = sum( coord( 1 , path( [ 1 , len ] ) ) ) / 2 ;
    y = sum( coord( 2 , path( [ 1 , len ] ) ) ) / 2 ;
    %x ,y求出每两个连线的中间点并做标注
    text( x , y , [ '(' , num2str( len ) , ')' ] ) ;  
    pause( 0.4 ) ;
    hold off ;
end