$aocyear = 2020
$aocday = "03"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue

$puzzleinput = get-content ".\2020\day-$aocday\input.txt"

########## Part 1 ############
$i = 0
$treesfound = 0
$tree = '#'
$square = '.'

foreach ($line in $puzzleinput) {
    $linecount = $line.Length
    if($i -ge $linecount) {
        $i = $i - $linecount
    }
    $square = $line.Substring($i,1)
    if ($square -eq $tree) {
        $treesfound++
    }
    $i = $i + 3
}

Write-Host "Part 1: $treesfound trees found" -ForegroundColor Green

#part 2 
#meeh gir opp litt, får komme tilbake til denne 
$SlopesRight = 1,3,5,7,1
$SlopesDown = 1,1,1,1,2
$j = 0
$i = 0
$tree = '#'
$sum = @()

foreach ($slope in $slopesright) {
    $treesfound = 0
    foreach ($line in $puzzleinput) {
        if ($j -eq 4) {           

#            if ($line % 2) { #denne er feil
#                    continue
#                }
        }
        if($i -ge $linecount) {
            $i = $i - $linecount
        }
        $square = $line.Substring($i,1)
        if ($square -eq $tree) {
            $treesfound++
        }
        $i = $i + $slope
    }
    Write-Host "Part 2: $treesfound trees found" -ForegroundColor Green
    $sum += $treesfound
    $j++
    
    }

$sum[0] * $sum[1] * $sum[2] * $sum[3]
