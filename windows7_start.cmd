@echo off
chcp 65001
title IYUUPlus
cd /d "%~dp0"
echo Docker: https://hub.docker.com/r/iyuucn/iyuuplus
echo Gitee: https://gitee.com/ledc/iyuuplus
echo Github: https://github.com/ledccn/IYUUPlus
echo QQ: 859882209 / 931954050 / 924099912
echo Wenda: http://wenda.iyuu.cn
echo Token: https://iyuu.cn
echo Blog: https://www.iyuu.cn
echo Docs: http://api.iyuu.cn/docs.php
echo.
goto :ping

:ping
echo "���ڼ�����磬�����ĵȴ�..."
ping demo.iyuu.cn
echo.
goto :checkEnv

:checkEnv
echo "���.env.example�ļ��Ƿ����..."
if exist "%~dp0.env.example" goto :checkGit
echo "���GIT�����԰�װԴ��..."
git --version|find "git version">nul&&goto :install
goto :installError

:install
echo "����ʹ��GIT����Դ��..."
git clone https://gitee.com/ledc/iyuuplus.git %~dp0IYUUPlus
echo "ͨ��GIT��װ��ɣ���ʼ���phpִ�г���..."
cd IYUUPlus
goto :checkPHP

:installError
cls
echo "��ǰ���л���δ��⵽GIT����Դ�밲װʧ�ܣ����ֶ�����"
echo "Docker: https://hub.docker.com/r/iyuucn/iyuuplus"
echo "Gitee: https://gitee.com/ledc/iyuuplus"
echo "Github: https://github.com/ledccn/IYUUPlus"
pause
goto :end

:checkGit
echo "���GIT���򣬳����Զ�����Դ��..."
git --version|find "git version">nul&&goto :pull
cls
echo "��ǰIYUUPlus���л���δ��⵽git���򣬲�֧���Զ����¡�"
echo "�Ƽ���ʹ��git�����ش���⣡"
echo "�������ڰ�װgit������������������룺"
echo "git clone https://gitee.com/ledc/iyuuplus.git"
goto :checkPHP

:pull
echo "���ڼ��Դ����git�����ļ�..."
if exist "%~dp0.git\config" (
    echo "����Ϊ���Զ�����..."
    git fetch --all
    git reset --hard origin/master
    echo "������ɣ�"
) else (
    echo "��ǰIYUUPlusԴ�룬����ͨ��git��ȡ����֧���Զ�����"
)
echo.
goto :checkPHP

:checkPHP
if exist "%~dp0php\php.exe" (set PHP_BINARY=%~dp0php\php.exe) else (set PHP_BINARY=php.exe)
echo "PHP�����Ƴ���"%PHP_BINARY%
%PHP_BINARY% -v|find "PHP Group">nul&&goto :start
cls
echo "û�м�⵽PHPִ�г��򣡣���"
echo "����������ع�php�������ڽ�ѹ���󣬰�php�ļ�����ӽ�ϵͳ�Ļ���������"
echo "���߰�phpִ�г��򣬽�ѹ������ǰĿ¼�µ�php�ļ��С�"
echo "�ű�������ֹ������"
pause
goto :end

:start
%PHP_BINARY% -v
echo.
echo "�������Ҫֹͣ�����밴����ϼ���CTRL + C"
%PHP_BINARY% start.php task.php
pause
goto :end

:end
rem ����
echo.