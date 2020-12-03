$aocyear = 2020
$aocday = "01"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue


#Part 1 
[int[]]$puzzleinput = get-content ".\2020\day-$aocday\input.txt"
$aocanswer = "2020"

$WeAreBreakingShitUp = $false

        foreach ($firstnumber in $puzzleinput) {
            if ($WeAreBreakingShitUp) {Break}
            foreach ($secondnumber in $puzzleinput) {
                if (($firstnumber+$secondnumber) -eq $aocanswer) {
                    $correctkey1 = $firstnumber
                    $correctkey2 = $secondnumber  
                    Write-Host "We have something Master!" -BackgroundColor Red
                    Write-Host "The numbers are $correctkey1 and $Correctkey2" -ForegroundColor Green
                } 
            } 
        }

Write-Host "We...must...multiply..." -ForegroundColor Green
Write-Host "INITIALIZING TURBO BOOST CLOCK " -ForegroundColor Red
$myanswerpart1 = $correctkey1*$correctkey2

Write-Host "Part 1 is complete Master!, We must summarize:" -ForegroundColor Green
Write-Host "Numbers $correctkey1 and $correctkey2 adds up to $aocanswer" -ForegroundColor Green
Write-Host "Answer to Part 1: $myanswerpart1" -ForegroundColor Green


#Part 2
Write-Host "Master I am ready for Part 2..." -ForegroundColor Yellow
Write-Host "Copying Part 1 and adding another foreach loop!" -ForegroundColor Yellow

        foreach ($firstnumber in $puzzleinput) {
            if ($WeAreBreakingShitUp) {Break}
            foreach ($secondnumber in $puzzleinput) {
                if ($WeAreBreakingShitUp) {Break}
                    foreach ($thirdnumber in $puzzleinput) {
                    if (($firstnumber+$secondnumber+$thirdnumber) -eq $aocanswer) {
                        $correctkey1 = $firstnumber
                        $correctkey2 = $secondnumber 
                        $correctkey3 = $thirdnumber 
                        Write-Host "We have something Master!" -BackgroundColor Red
                        Write-Host "The numbers are $correctkey1 and $Correctkey2 and $correctkey3" -ForegroundColor Green
                    } 
                }
            } 
        }
 
$myanswerpart2 = $correctkey1*$correctkey2*$correctkey3

Write-Host "Answer to Part 2: $myanswerpart2" -ForegroundColor Green