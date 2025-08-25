$uri = "https://raw.githubusercontent.com/CanvasDeno/VectorXone/refs/heads/main/editor.html"
$filename = "VectorXone?"
$outPath = Join-Path (Get-Location) $filename

Invoke-WebRequest -Uri $uri -OutFile $outPath

Write-Host "`nFile downloaded to: $outPath"
$choice = Read-Host "Do you want to install VectorXone in your computer? (Y/N)"

if ($choice -match '^[Yy]$') {
    Write-Host "Installing VectorXone..."
    $installPath = Join-Path $env:USERPROFILE "TretroBox\Modules"
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
    Copy-Item $outPath -Destination $installPath -Force
    Write-Host "Installed to $installPath, Open the file in a web browser to use it."
} else {
    Write-Host "Installation cancelled. File remains in current directory."
}
