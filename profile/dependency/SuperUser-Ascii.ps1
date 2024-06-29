$su_info = $MAIN_JSON_Data.info
$var_version = $su_info.version
$var_author    = $su_info.author
$var_last_update = $su_info.update
$var_github    = $su_info.github
$var_website   = $su_info.website
$var_youtube   = $su_info.youtube

$initial_mark = "|    |          |"

Write-Host "$initial_mark---------------------------------------------------------------------------------------------------|" -ForegroundColor Yellow

Write-Host "$initial_mark     ____                        " -ForegroundColor Yellow -NoNewline
Write-Host "_   _                                                             |" -ForegroundColor Green
#-------------------------------------------------------------------------------------------------------
Write-Host "$initial_mark    / ___| _   _ _ __   ___ _ __" -ForegroundColor Yellow -NoNewline
Write-Host "| | " -ForegroundColor Green -NoNewline
Write-Host "| |___  ___ _ __  " -ForegroundColor Green -NoNewline
Write-Host " $var_version " -ForegroundColor Cyan -NoNewline
Write-Host " | " -NoNewline
Write-Host "$var_last_update                      |" -ForegroundColor Yellow 
#-------------------------------------------------------------------------------------------------------
Write-Host "$initial_mark    \___ \| | | | '_ \ / _ \ '__| " -ForegroundColor Yellow -NoNewline 
Write-Host "| | / __|/ _ \ '__| " -ForegroundColor Green -NoNewline
Write-Host " by " -NoNewline
Write-Host $var_author -ForegroundColor Cyan  -NoNewline
Write-Host "                         |" -ForegroundColor Yellow 
#-------------------------------------------------------------------------------------------------------
Write-Host "$initial_mark     ___) | |_| | |_) |  __/ |  | " -ForegroundColor Yellow -NoNewline
Write-Host "|_| \__ \  __/ |     " -ForegroundColor Green -NoNewline
Write-Host $var_github -ForegroundColor Green -NoNewline
Write-Host " |" -ForegroundColor Yellow 
#-------------------------------------------------------------------------------------------------------
Write-Host "$initial_mark    |____/ \__,_| .__/ \___|_|   " -ForegroundColor Yellow -NoNewline
Write-Host "\___/|___/\___|_|   " -ForegroundColor Green -NoNewline
Write-Host "  $var_website            |" -ForegroundColor Green 
#-------------------------------------------------------------------------------------------------------
Write-Host "$initial_mark                |_|                                    " -ForegroundColor Yellow -NoNewline
Write-Host "$var_youtube     |"  -ForegroundColor Green 

Write-Host "$initial_mark---------------------------------------------------------------------------------------------------|" -ForegroundColor Yellow
