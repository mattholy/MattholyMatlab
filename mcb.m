clc;
clearvars;
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
disp('┃                马特浩倪Matlab代码部署系统                    ┃');
disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
disp('  检查Matlab版本..............                        ');
disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
pause(1);
softVer=1.0
currentVer = version;
currentVer = str2double(currentVer(1:3));
ver = version;
verCheck = 'n';
clc
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
disp('┃                马特浩倪Matlab代码部署系统                    ┃');
disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
fprintf('  当前Matlab版本：%s              \n',ver);
if currentVer < 9
    disp('  Matlab程序版本过低，可能导致某些功能不正常。');
    verCheck = input('  是否继续[y/n] : ','s');
else
    disp('  Matlab版本正常，程序继续。');
    verCheck = 'y';
    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
    pause(1); 
end
if verCheck == 'y'
    clc
    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
    disp('┃                马特浩倪Matlab代码部署系统                    ┃');
    disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
    disp('  正在检测网络情况....');
    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
    pause(1)
    [html,conStatus]=urlread('https://github.com');
    if conStatus==0
         clc
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        disp('┃                马特浩倪Matlab代码部署系统                    ┃');
        disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        disp('  当前网络未连接。');
        disp('  本程序需要连接到网络来下载相关代码');
        disp('  没有网络连接本程序将无法正常运行。');
        disp('  按任意键继续.....');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        pause
    else
        clc
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        disp('┃                马特浩倪Matlab代码部署系统                    ┃');
        disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        disp('  当前网络连接正常。');
        disp('  正在下载目录，根据连接速度，这将需要一小会儿，请稍候...');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        tic;
        index =urlwrite('https://github.com/mattholy/MattholyMatlab/blob/master/index.xlsx?raw=true','index.xlsx');
        time=toc;
        clc
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        disp('┃                马特浩倪Matlab代码部署系统                    ┃');
        disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
        indexSize = dir('index.xlsx');
        indexSize = indexSize.bytes/1024;
        speed = indexSize/time;
        fprintf('  已下载完成，用时%.2f秒,平均速度%.2fkb/s  \n',time,speed);
        disp('  读取目录中，请稍候...');
        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        [a,b,c]=xlsread('index.xlsx');
        delete ('index.xlsx');
        [items,y]=size(c);
        pause(2);
        while(true)
            clc
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('┃                马特浩倪Matlab代码部署系统                    ┃');
            disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            target = input('  请输入接收码（通常这是您的手机号或者QQ号） : ','s');
            k = str2double(target);
            if isnan(k)
            else
                disp('  查询中，请稍候...');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                break
            end
        end
        itemCount=0;
        itemPos=[];
        for i=(2:1:items)
            for j=(4:1:5)
                if c{i,j}==k
                    itemCount=itemCount+1;
                    itemPos=[itemPos,i];
                end
            end
        end
        while itemCount==0
            for i=(2:1:items)
                for j=(4:1:5)
                    if c{i,j}==target
                        itemCount=itemCount+1;
                        itemPos=[itemPos,i];
                    end
                end
            end
            while(true)
                clc
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                target = input('  请输入接收码（通常这是您的手机号或者QQ号） : ','s');
                k = str2double(target);
                if isnan(k)
                    clc
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                    disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    disp('  请输入数字！');
                    target = input('  请输入接收码（通常这是您的手机号或者QQ号） : ','s');
                else
                    disp('  查询中，请稍候...');
                    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                    break
                end
            end
        end
        itemOutput={};
        for i=(1:1:itemCount)
            for j=(1:1:6)
                itemOutput{i,j}=c{itemPos(i),j};
            end
        end
        while(true)
            clc
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('┃                马特浩倪Matlab代码部署系统                    ┃');
            disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('  当前目录：');
            disp('   序号        名称');
            for(i=1:1:itemCount)
                fprintf('    %d          %s  \n',i,itemOutput{i,1});
            end
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            choice = input('  请输入序号选择 (数字): ','s');
            choicePick = str2double(choice);
            if isnan(choicePick)
            else
                break;
            end
        end
        while choicePick<1|choicePick>(items-1)
            clc
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('┃                马特浩倪Matlab代码部署系统                    ┃');
            disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('  您的输入有误，请重新确认！');
            disp('  按任意键继续...');
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            pause
            clc
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('┃                马特浩倪Matlab代码部署系统                    ┃');
            disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
            disp('  当前目录：');
            disp('   序号        名称');
            for(i=2:1:items)
                fprintf('    %d          %s  \n',c{i,1},c{i,2});
            end
            disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
            choice = input('  请输入序号选择 (数字): ');
        end
        disp('┗━123123123━━━━━━━━━━━━━━━━━━━━━━━━━┛');
        pause
    end
end
clc
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
disp('┃                马特浩倪Matlab代码部署系统                    ┃');
disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
disp('  程序已结束，按任意键退出。                        ');
disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
pause;
clc;
clearvars;