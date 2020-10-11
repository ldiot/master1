clear
clc
popsize=50;                             	
%��Ⱥ��С
chromlength=10;                     		
%�ַ�������(���峤��)
pc=0.6;                                    	
%������ʣ�ֻ���������С��pcʱ���Ż��������
pm=0.001;                               	
%�������
global weight;
weight=[15 18 17 9 7 11 6 8 2 4]';
%��Ʒ����
global price;
price=[11 12 9 8 12 14 8 12 7 8]';
%��Ʒ��ֵ
pop=initpop(popsize,chromlength);	
%���������ʼȺ��
for i=1:20                                                           	
%50Ϊ�Ŵ�����
		
        [fitvalue,poptemp1]=calfitvalue(pop);
        %������Ⱥ�и���Ŀ�꺯��ֵ����Ӧ��ֵ
		
        [newpop]=selection(poptemp1,fitvalue);
		%����    
        [newpop1]=crossover(newpop,pc); 
		%����
        [newpop2]=mutation(newpop1,pc);
		%����   

        [fitvalue,poptemp2]=calfitvalue(newpop2);              
		%������Ⱥ�и���Ŀ�꺯��ֵ����Ӧ��ֵ 

        [bestindividual,bestfit]=best(poptemp2,fitvalue);
		%���Ⱥ������Ӧ��ֵ���ĸ��弰����Ӧ��ֵ
        
        fitvaluemean=mean(fitvalue);
        y1=fitvaluemean;
        y2=bestfit;
 
        plot(i,y1,'r*',i,y2,'g*');
        hold on
        title('01���������Ŵ��㷨���');
        xlabel('��������');
        ylabel('Ŀ��ֵ');
        legend('ƽ����Ӧ��','�����Ӧ��','location','best');
        pop=poptemp2;
        %������Ⱥ
end

[z,index]=max(fitvalue);
bestprice=z
bestscheme=bestindividual


