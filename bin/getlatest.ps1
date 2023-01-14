Param(
    [String]$Arg1,
    [String]$Arg2 = '.*(windows|win64|((x86|amd)_?)?64|win32)?.*\.(zip|exe)'
)

Function gitlatest($url, $pattern = $Arg2){
    $url = $url.replace("https://github.com", "https://api.github.com/repos")
    $res = $(curl.exe -sL $url) -replace "`s*`"body`":.*",""
    $res = ($res -join "`n") -replace ",(\n\s*\})", "`$1"
    $j = ConvertFrom-Json "$res"
    $assets = foreach($rl in $j.assets) {
        If($rl.name -match $pattern -and $rl.name -notmatch "darwin|arm"){
            $rl.browser_download_url
        }
    }
    If($assets.Length -gt 0) {
        return $assets[0]
    } else {
        return ""
    }
}

Function nodelatest($url){
    $v = $(curl.exe -sL "https://nodejs.org/dist/index.json" | ConvertFrom-Json)[0].version
    return "https://nodejs.org/dist/$v/node-$v-win-x64.zip"
}

Function getlatest($url, $pattern = $Arg2) {
    If($url -match "https://.*github.com.*") {
        return (gitlatest $url $pattern)
    } elseIf($url -match "https://.*nodejs.org.*") {
        return (nodelatest $url)
    } else {
        return $url
    }
}

getlatest $Arg1 $Arg2
