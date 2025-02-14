$repoUrl = "https://github.com/cout00/GDB-Profiles/archive/refs/heads/main.zip"
$zipPath = "$env:TEMP\GDB-Profiles.zip"
$extractPath = "$PSScriptRoot\Profiles"

# Удаляем старую папку, если она есть
if (Test-Path $extractPath) {
    Remove-Item -Recurse -Force $extractPath
}

# Скачиваем ZIP-архив
Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath

# Распаковываем в папку Profiles
Expand-Archive -Path $zipPath -DestinationPath $PSScriptRoot

# Переименовываем распакованную папку
Rename-Item -Path "$PSScriptRoot\GDB-Profiles-main" -NewName "Profiles" -Force

# Удаляем скачанный архив
Remove-Item -Force $zipPath

Write-Output "Репозиторий успешно загружен в $extractPath"
pause