# Prompt (Oh My Posh) com cache
$OMP_CACHE = "$PSScriptRoot\omp-init.ps1"

if (Test-Path $OMP_CACHE) {
    . $OMP_CACHE
} else {
    # Fallback caso o arquivo de cache suma
    oh-my-posh init pwsh --config "$PSScriptRoot\brunofow.omp.json" | Invoke-Expression
}

# =====================================================================
# Icons
# =====================================================================
if ($Host.Name -eq 'ConsoleHost' -or $Host.Name -eq 'Visual Studio Code Host')
{
    # Import-Module pode ser lento. O parâmetro -Fast não existe,
    # mas evitar redundância ajuda.
    if (-not (Get-Module -Name Terminal-Icons))
    {
        Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue
    }
}

# =====================================================================
# PSReadline
# =====================================================================
if (Get-Module -Name PSReadLine)
{
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
}

# =====================================================================
# Alias & Wrapper Functions
# =====================================================================
function EzaList
{ eza -1 -l $args
}
function EzaListAll
{ eza -1 -l -a $args
}

function Touch-File {
    foreach ($file in $args) {
        if (Test-Path $file) {
            (Get-Item $file).LastWriteTime = Get-Date
        } else {
            New-Item -ItemType File -Path $file | Out-Null
        }
    }
}

Set-Alias touch Touch-File
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias cat bat
Set-Alias ls EzaList
Set-Alias la EzaListAll

# =====================================================================
# Utilities
# =====================================================================
function which ($command)
{
    (Get-Command -Name $command -ErrorAction SilentlyContinue).Path
}
