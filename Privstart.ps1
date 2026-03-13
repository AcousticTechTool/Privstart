$token = Read-Host "GitHub Token"
$user  = Read-Host "GitHub Username"
$repo  = Read-Host "Repository"
$file  = Read-Host "Datei inkl. Pfad"

$url = "https://api.github.com/repos/$user/$repo/contents/$file" + "?ref=main"

Write-Host ""
Write-Host "Verwendeter GitHub Link:"
Write-Host $url
Write-Host ""

irm $url -Headers @{
    Authorization = "Bearer $token"
    Accept        = "application/vnd.github.v3.raw"
} | iex



Write-Host $url

Read-Host "Drücke Enter zum Fortfahren"