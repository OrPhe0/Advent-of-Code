$aocyear = 2020
$aocday = "06"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue

#$puzzleinput = gc ".\2020\day-$aocday\input.txt"

$PuzzleInput = (Get-Content -Path ".\2020\day-$aocday\input.txt" -Raw) -split [System.Environment]::NewLine+[System.Environment]::NewLine -replace [System.Environment]::NewLine
($PuzzleInput.ForEach({
    ([char[]]$_ | Select-Object -Unique).Count
}) | Measure-Object -Sum).Sum

$PuzzleInput = (Get-Content -Path ".\2020\day-$aocday\input.txt" -Raw) -split [System.Environment]::NewLine+[System.Environment]::NewLine
$CommonAnswers = foreach ($Group in $PuzzleInput) {
    $Group.ForEach({
        [char[]]$_ | Group-Object |
            Where-Object Count -eq ($Group -split [System.Environment]::NewLine).Count
    }).Count
}
($CommonAnswers | Measure-Object -Sum).Sum