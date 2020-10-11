%����������Ӧֵ
%Name:calfitvalue.m

function [fitvalue,poptemp]=calfitvalue(pop)
global price;
global weight;
[px,py]=size(pop);

%����Ŀ�꺯��ֵ
for i=1:px
    objvalue(i)=pop(i,:)*price;
    convalue(i)=pop(i,:)*weight;
end

%������Ⱥ��Ӧ��ֵ
for i=1:px
        if convalue(i)<=60                   
                temp=objvalue(i);          
        else
                temp=0;
        end
        fitvalue(i)=temp;
end

%�����Ÿ������������Լ�������ĸ���
[maxfit,mn]=max(fitvalue);
for i=1:px
    if convalue(i)>60
            poptemp(i,:)=pop(mn,:);
            fitvalue(i)=maxfit;
    else
            poptemp(i,:)=pop(i,:);            
    end
end

fitvalue=fitvalue';
