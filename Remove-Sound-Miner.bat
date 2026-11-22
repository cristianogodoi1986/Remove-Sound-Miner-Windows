@echo off
chcp 65001 >nul
title Ferramenta de Remoção - Minerador C:\Sound
color 0A

:: ============================================================
::  Remove-Sound-Miner.bat
::  Remove o minerador que usa a pasta C:\Sound no Windows 10/11
::  Execute SEMPRE como Administrador
:: ============================================================

:: Verifica privilégios de Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo.
    echo  [ERRO] Execute este script como ADMINISTRADOR!
    echo         Clique com o botão direito > Executar como administrador
    echo.
    pause
    exit /b 1
)

echo ========================================================
echo   INICIANDO LIMPEZA DO MINERADOR (PASTA C:\Sound)
echo ========================================================
echo.

echo [1/5] Encerrando processos maliciosos e scripts ocultos...
taskkill /F /IM gtservices.exe >nul 2>&1
taskkill /F /IM mouse.exe >nul 2>&1
taskkill /F /IM wscript.exe >nul 2>&1
taskkill /F /IM cscript.exe >nul 2>&1
echo       Processos finalizados (quando existiam).

echo [2/5] Parando e removendo possíveis serviços de drivers...
sc stop WinIo64 >nul 2>&1
sc delete WinIo64 >nul 2>&1
sc stop WinRing0_1_2_0 >nul 2>&1
sc delete WinRing0_1_2_0 >nul 2>&1
echo       Serviços tratados.

echo [3/5] Removendo atalhos maliciosos da Inicialização...
del /F /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\system.lnk" >nul 2>&1
del /F /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Audio.lnk" >nul 2>&1
del /F /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\*.vbs" >nul 2>&1
del /F /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\*.bat" >nul 2>&1
echo       Atalhos de Startup limpos.

echo [4/5] Forçando a exclusão da pasta C:\Sound...
if exist "C:\Sound" (
    attrib -h -s -r "C:\Sound\*.*" /S /D >nul 2>&1
    del /F /Q "C:\Sound\*.*" >nul 2>&1
    rmdir /S /Q "C:\Sound" >nul 2>&1
)

if exist "C:\Sound" (
    color 0E
    echo.
    echo  [AVISO] A pasta C:\Sound ainda existe.
    echo          Algum driver ou processo pode estar preso no kernel.
    echo          Reinicie o Windows no Modo de Segurança e rode
    echo          este script novamente.
    echo.
) else (
    echo       [OK] Pasta C:\Sound removida com sucesso!
)

echo.
echo [5/5] Verificando tarefas agendadas suspeitas...
echo       (se nenhuma linha aparecer abaixo, não há tarefas suspeitas)
echo --------------------------------------------------------
schtasks /query /fo LIST /v 2>nul | findstr /I "Sound gtservices .vbs .bat"
echo --------------------------------------------------------

echo.
echo ========================================================
echo   LIMPEZA CONCLUÍDA!
echo   RECOMENDAÇÃO: Reinicie o computador agora.
echo ========================================================
echo.
pause
