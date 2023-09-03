# ---------------------------------------
# Use the following line to search for all vimrc files on the system
# then type those in the list of vimrcFiles below.
# Get-ChildItem -Path C:\ -Recurse -File -Filter "*vimrc*" | ForEach-Object { $_.FullName }
# ---------------------------------------
# Prompt user for the vimrc file path
$userVimrcPath = Read-Host -Prompt 'Enter the path to your vimrc file'

# Convert single backslashes to double backslashes
$convertedPath = $userVimrcPath -replace '\\', '\\\\'

# List of vimrc file paths that need to source the vimrc file
$vimrcFiles = @(
    'C:\Program Files\Git\etc\vimrc',
    'C:\tools\Cmder\vendor\git-for-windows\etc\vimrc',
    'C:\Users\lunde\.vimrc'
)

# Update each file
foreach ($file in $vimrcFiles) {
    # Check if file exists
    if (Test-Path $file) {
        Write-Output "Found $file"

        # Set the content of the file to only the new "source" line with UNIX line endings
        "source $convertedPath" -replace "\r\n", "`n" | Set-Content -Path $file -NoNewline

        Write-Output "Updated $file with the source line"
    } else {
        Write-Output "$file not found"
    }
}
