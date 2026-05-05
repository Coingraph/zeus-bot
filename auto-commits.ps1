$TOTAL = 100

$files = @("src/bot.js", "src/strategy.js", "src/config.js")

for ($i = 1; $i -le $TOTAL; $i++) {

    $file = $files | Get-Random

    Add-Content $file "`n// auto commit step $i"

    git add .

    $types = @("feat", "fix", "refactor", "chore", "perf")
    $type = $types | Get-Random

    git commit -m "$type: automated commit $i"

    Write-Host "Commit $i / $TOTAL done"

    Start-Sleep -Milliseconds 300
}

git push
