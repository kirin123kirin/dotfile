Param(
    [String]$Arg1,
    [String]$Arg2,
    [String]$Arg3 = "*"
)

Function dunzip($expdir, $url, $target = "*"){
    $TMPNAME = "$env:TEMP\workdir_download_will_unzip"
    Remove-Item -Force -Recurse "$TMPNAME*"
    curl.exe -sL -o "$TMPNAME.zip" $url

    if ( !(Test-Path "$TMPNAME.zip") ) {
        echo ダウンロードに失敗しました
        return
    }
    if ( !(Test-Path $expdir) ) {
        mkdir $expdir
    }

    if ( $target -eq "*" ) {
      7z.exe x -o"$expdir" "$TMPNAME.zip" -aoa
    } else {
      7z.exe x -o"$TMPNAME" "$TMPNAME.zip" -aoa
      Copy-Item -Force -Recurse "$TMPNAME\$target" "$expdir\"
    }

    Remove-Item -Force -Recurse "$TMPNAME*"

}

dunzip "$Arg1" "$Arg2" "$Arg3"
