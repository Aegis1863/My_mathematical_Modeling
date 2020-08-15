function [ objval ] = pathfare( fare , path )
    % 计 算 路 径 path 的 代 价 objval
    % path 为 1 到 n 的 排 列 ，代 表 城 市 的 访 问 顺 序 ；
    % fare 为 代 价 矩 阵 ， 且 为 方 阵 。
    [ m , n ] = size( path ) ;  % m为路径数量，此时为1，n为路径节点数，即城市个数100
    objval = zeros( 1 , m ) ;
    for i = 1 : m
        for j = 2 : n
            objval( i ) = objval( i ) + fare( path( i , j - 1 ) , path( i , j ) ) ;  %加总中间路成
        end
        objval( i ) = objval( i ) + fare( path( i , n ) , path( i , 1 ) ) ;  % 返回原点，加上最后一个点回原点距离
    end
end