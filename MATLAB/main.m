clear all;

result = zeros(10,1);
%ʶ��0-9
for i = 0:9
    fprintf('����ʶ������%d...',i);
    result(i+1) = speechrecognition(i);
    fprintf('����%d��ʶ������%d\n',i,result(i+1));
end
