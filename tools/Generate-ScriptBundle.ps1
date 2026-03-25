param(
    [string]$ScriptsDir = "scripts",
    [string]$OutputPath = "ScriptsReturn.json"
)

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$scriptsRoot = Resolve-Path (Join-Path $repoRoot $ScriptsDir)
$bundlePath = Join-Path $repoRoot $OutputPath

function Get-RelativeUnixPath {
    param(
        [string]$BasePath,
        [string]$TargetPath
    )

    $directorySeparator = [System.IO.Path]::DirectorySeparatorChar
    $altDirectorySeparator = [System.IO.Path]::AltDirectorySeparatorChar
    $resolvedBasePath = (Resolve-Path $BasePath).Path.TrimEnd($directorySeparator, $altDirectorySeparator)
    $resolvedTargetPath = (Resolve-Path $TargetPath).Path
    $basePrefix = "$resolvedBasePath$directorySeparator"

    if (-not $resolvedTargetPath.StartsWith($basePrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Target path '$resolvedTargetPath' is not inside '$resolvedBasePath'."
    }

    return $resolvedTargetPath.Substring($basePrefix.Length).Replace($directorySeparator, '/').Replace($altDirectorySeparator, '/')
}

$allowedExtensions = @(".lua", ".luau")
$scriptFiles = Get-ChildItem -LiteralPath $scriptsRoot -File -Recurse |
    Where-Object { $allowedExtensions -contains $_.Extension.ToLowerInvariant() } |
    Sort-Object FullName
$bundleItems = foreach ($scriptFile in $scriptFiles) {
    $relativePath = Get-RelativeUnixPath -BasePath $scriptsRoot.Path -TargetPath $scriptFile.FullName
    $source = Get-Content -LiteralPath $scriptFile.FullName -Raw
    $source = $source -replace "`r`n", "`n"
    $source = $source -replace "`r", "`n"

    [PSCustomObject]@{
        file = $relativePath
        source = $source
    }
}

$jsonItems = @($bundleItems | ForEach-Object { $_ | ConvertTo-Json -Depth 3 -Compress })
$json = "[" + ($jsonItems -join ",") + "]"
[System.IO.File]::WriteAllText($bundlePath, $json + "`n", [System.Text.UTF8Encoding]::new($false))
