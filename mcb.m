clc;
clearvars;
clear all;
delete('onRun.p');
delete('onRun.mlapp');
%setup end
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
        update=0;
        for i=(2:1:items)
            if strcmp(c{i,2},'update')
                update=1;
                updateItem=i;
            end
        end
        if update==0
            itemCount=0;
            itemPos=[];
            times=0;
            isNumCheckGet=1;
            while itemCount==0
                times=times+1;
                while(true)
                    clc
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                    disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    if times==1
                    else
                        disp('  未查询到相关目录，请查证接收码。');
                    end
                    if isNumCheckGet==0
                        disp('  请输入数字！');
                    end
                    target = input('  请输入接收码（通常这是您的手机号或者QQ号） : ','s');
                    k = str2double(target);
                    if isnan(k)
                        isNumCheckGet=0;
                    else
                        isNumCheckGet=1;
                        clc
                        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                        disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                        disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                        disp('  查询中，请稍候...');
                        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                        break
                    end
                end
                for i=(2:1:items)
                    for j=(4:1:5)
                        if c{i,j}==k
                            itemCount=itemCount+1;
                            itemPos=[itemPos,i];
                        end
                    end
                end
            end
            itemOutput={};
            for i=(1:1:itemCount)
                for j=(1:1:6)
                    itemOutput{i,j}=c{itemPos(i),j};
                end
            end
            isNumCheck=0;
            choice='a';
            choicePick = str2double(choice);
            while(isNumCheck==0)
                if isnan(choicePick)
                    clc
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                    disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                    disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                    disp('  当前目录43433：');
                    disp('   序号        名称');
                    for(i=1:1:itemCount)
                        fprintf('    %d          %s  \n',i,itemOutput{i,1});
                    end
                    disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                    choice = input('  请输入序号选择 (数字): ','s');
                    choicePick = str2double(choice);
                else
                    if (choicePick<1)|(choicePick>itemCount)
                        clc
                        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                        disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                        disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                        disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                        disp('  您的输入有误，请重新确认！');
                        disp('  按任意键继续...');
                        disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                        choice='a';
                        choicePick = str2double(choice);
                        pause
                    else
                        isNumCheck=1;
                    end
                end
            end
            if itemOutput{choicePick,7}==1
                clc
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('  下载文件中，请稍候...');
                tic;
                Download =urlwrite(itemOutput{choicePick,3},itemOutput{choicePick,6});
                time=toc;
                indexSize = dir(itemOutput{choicePick,6});
                indexSize = indexSize.bytes/1024;
                speed = indexSize/time;
                fprintf('  已下载完成，用时%.2f秒,平均速度%.2fkb/s  \n',time,speed);
                disp('  读取文件中，请稍候...');
                onRun
                disp('  文件已打开，按任意键继续...');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                pause;
            else
                clc
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('  下载文件中，请稍候...');
                tic;
                Download =urlwrite(itemOutput{choicePick,3},itemOutput{choicePick,6});
                time=toc;
                indexSize = dir(itemOutput{choicePick,6});
                indexSize = indexSize.bytes/1024;
                speed = indexSize/time;
                fprintf('  已下载完成，用时%.2f秒,平均速度%.2fkb/s  \n',time,speed);
                fprintf('  文件名字是%s，稍后您可以手动运行它。  \n',itemOutput{choicePick,6});
                disp('  按任意键继续...');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                pause;
            end
        else
            if c{updateItem,7}==1
                updateDownload =urlwrite(c{updateItem,3},'onRun.p');
                onRun
                disp('  更新完毕，按任意键继续...');
                pause;
            else
                clc
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('┃                马特浩倪Matlab代码部署系统                    ┃');
                disp('┃                             版本：1.0    创建于：2017/3/17   ┃');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                disp('┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓');
                disp('  发现更新，现在即将更新，请稍候...');
                pause(0.5);
                disp('  连接更新服务器...');
                disp('  下载更新文件...');
                tic;
                updateDownload =urlwrite(c{updateItem,3},c{updateItem,6});
                time=toc;
                indexSize = dir(c{updateItem,6});
                indexSize = indexSize.bytes/1024;
                speed = indexSize/time;
                fprintf('  已下载完成，用时%.2f秒,平均速度%.2fkb/s  \n',time,speed);
                disp('  更新文件已经保存');
                disp('  为了使用方便，请删除本文件');
                fprintf('  将更新文件%s命名为mcb.p  \n',c{updateItem,6});
                disp('  更新完毕，按任意键继续...');
                disp('┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛');
                pause;
            end
        end
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