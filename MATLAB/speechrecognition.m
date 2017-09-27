function [result] = speechrecognition(testnum)

%disp('���ڼ���ο�ģ��Ĳ���...')
%����ο�ģ��Ĳ���
for i=0:9
    fname=sprintf('./data/train/%d.wav',i);
    x=wavread(fname);
    [x1 x2]=vad(x);
    m=mfcc(x);
    m=m(x1-2:x2-4,:);
    ref(i+1).mfcc=m;
end

%�������ģ��Ĳ���
fname=sprintf('./data/test/%d.wav',testnum);
x=wavread(fname);
[x1 x2]=vad(x);
m=mfcc(x);
m=m(x1-2:x2-4,:);
test_mfcc=m;

%����ģ��ƥ��
dist=zeros(10,1);
for j=0:9
  dist(j+1)=dtw(test_mfcc,ref(j+1).mfcc);
  %fprintf('processing �ٷ�֮%d\n',(j+1)*10);
end

%disp('���ڼ���ƥ����...');
%����ƥ����
disp(dist);
[d,j]=min(dist);
%fprintf('����ģ��%d��ʶ����Ϊ:%d\n',testnum,j-1);
result = j-1;

