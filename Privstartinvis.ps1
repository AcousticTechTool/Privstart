Clear-Host

# Token verdeckt eingeben
$secureToken = Read-Host "GitHub Token" -AsSecureString
$token = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)
)

# Username verdeckt
$secureUser = Read-Host "GitHub Username" -AsSecureString
$user = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureUser)
)

# Repository verdeckt
$secureRepo = Read-Host "Repository" -AsSecureString
$repo = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureRepo)
)

# Datei Pfad verdeckt
$secureFile = Read-Host "Datei inkl. Pfad" -AsSecureString
$file = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureFile)
)

$url = "https://api.github.com/repos/$user/$repo/contents/$file" + "?ref=main"

irm $url -Headers @{
    Authorization = "Bearer $token"
    Accept        = "application/vnd.github.v3.raw"
} | iex

Read-Host "Drücke Enter zum Fortfahren"