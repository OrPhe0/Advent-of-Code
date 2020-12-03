$aocyear = 2020
$aocday = "02"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue

$puzzleinput = get-content ".\2020\day-$aocday\input.txt"

#Part 1

$count = $null

foreach ($line in $puzzleinput) {
    $line = $line.split(" ")
    $policynumber = $line[0].Split("-")
    $lowernumber = $policynumber[0]
    $uppernumber = $policynumber[1]
    $policyletter = $line[1].Replace(":","")
    $password = $line[2]

    $countchars = ($password.ToCharArray() | Where-Object {$_ -eq $policyletter} | Measure-Object).Count

    if ($countchars -in $lowernumber .. $uppernumber) {
        $count++
    }
}

Write-Host "Valid passwords part 1: $count" -ForegroundColor Green


#Part 2 
$count = $null

foreach ($line2 in $puzzleinput) {
    $line2 = $line2.split(" ")
    $policynumber = $line2[0].Split("-")
    $lowernumber = $policynumber[0]
    $uppernumber = $policynumber[1]
    $policyletter = $line2[1].Replace(":","")
    $password = $line2[2]

    #fixing the shift 0 = 1
    $first = $lowernumber -1  
    $second = $uppernumber -1

    if ($password[$first] -eq $policyletter -or $password[$second] -eq $policyletter -and !(($password[$first] -eq $policyletter -and $password[$second] -eq $policyletter))) {
        $count++
    }
}

Write-Host "Valid passwords part 2: $count" -ForegroundColor Green
