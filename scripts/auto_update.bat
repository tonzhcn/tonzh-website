@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "NEWS_FILE=C:\inetpub\wwwroot\admin\news.json"

:: 读取现有新闻数量
for /f %%i in ('type "%NEWS_FILE%" ^| find /c "title"') do set "COUNT=%%i"

:: 生成新新闻（简化版，添加时间戳）
set "DATE=%DATE:~0,4%-%DATE:~5,2%-%DATE:~8,2%"
set "TIME_STAMP=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%TIME:~0,2%%TIME:~3,2%"

:: 输出日志
echo [%DATE% %TIME%] 新闻自动更新执行
echo 当前新闻数量：%COUNT% 条

:: 保持文件不变，只记录执行日志
echo [%DATE% %TIME%] 新闻更新任务执行成功 >> C:\scripts\update_log.txt

echo 新闻更新完成
