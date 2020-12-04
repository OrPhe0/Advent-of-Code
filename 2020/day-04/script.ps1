$aocyear = 2020
$aocday = "04"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue

$puzzleinput = get-content ".\2020\day-$aocday\input.txt"

########## Part 1 & 2 ############
$passports = @()
$array = @()
$validpassports = 0
$invalidpassports = 0
$verifiedvalidpassports = 0
$verifiedinvalidpassports = 0
$i = 0

foreach ($line in $puzzleinput) {
    $splitting = $line -split " "
    $array += $splitting
}

$array = $array -join ", "
$passports = $array -split ", ,"

foreach ($passport in $passports) {
    Write-Host "Checking passport for person $i" -BackgroundColor Blue
    $validfield = @()
    if ($passport -match "ecl" -AND $passport -match "pid" -AND $passport -match "eyr" -AND $passport -match "hcl" -AND $passport -match "byr" -AND $passport -match "iyr" -AND $passport -match "hgt") {
    #-AND $passport -contains "cid" `n
        $validpassports++       
        $fields = $passport -split ","

        foreach ($field in $fields) {  
            if ($field -match "byr") {
                [int]$byr = $field -replace "byr:",""
                write-host "Checking BYR: $byr"
                if ($byr -ge 1920 -AND $byr -le 2002) {
                    $validfield += $true
                    write-host "byr verified" -ForegroundColor Green
                }   
                else {
                    write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }   
            }
            if ($field -match "iyr") {
                [int]$iyr = $field -replace "iyr:",""
                write-host "Checking iyr: $iyr"
                if ($iyr -ge 2010 -AND $iyr -le 2020) {
                    $validfield += $true
                    write-host "iyr verified" -ForegroundColor Green
                }   
                else {write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }               
            }
            if ($field -match "eyr") {
                [int]$eyr = $field -replace "eyr:",""
                write-host "Checking eyr: $eyr"
                if ($eyr -ge 2020 -AND $eyr -le 2030) {
                     $validfield += $true
                    write-host "eyr valid" -ForegroundColor Green
                }
                else {write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }               
            }
            if ($field -match "hgt") {
                $field = $field -replace "hgt:",""
                write-host "Checking hgt: $field"

                if ($field -match "cm") {
                    [int]$hgt = $field -replace "cm",""
                    if ($hgt -ge 150 -AND $hgt -le 193) {
                        $validfield += $true
                        write-host "hgt cm verified" -ForegroundColor Green
                    }
                    else {
                        write-host "NOT valid" -ForegroundColor Red
                        $validfield += $false         
                    }                 
                }
                if ($field -match "in") {
                    [int]$hgt = $field -replace "in",""
                    if ($hgt -ge 59 -AND $hgt -le 79) {
                        $validfield += $true
                        write-host "hgt in verified" -ForegroundColor Green
                    }
                    else {
                        write-host "NOT valid" -ForegroundColor Red
                        $validfield += $false
                    }                      
                }
                if ($field -notmatch "cm" -AND $field -notmatch "in") {
                    write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false                    
                }
            }
            if ($field -match "hcl") {
                $field = $field -replace "hcl:",""
                write-host "Checking hcl: $field"
                if ($field -match "#[a-fA-F0-9]{6}") {
                    $validfield += $true
                    write-host "hcl verified" -ForegroundColor Green
                }
                else {
                    write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }                   
            }
            if ($field -match "ecl") {
                $field = $field -replace "ecl:",""
                write-host "Checking ecl: $field"
                if ($field -match "amb" -or $field -match "blu" -or $field -match "brn" -or $field -match "gry" -or $field -match "grn" -or $field -match "hzl" -or $field -match "oth") {
                    $validfield += $true
                    write-host "ecl verified" -ForegroundColor Green
                } 
                else {
                    write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }                    
            }
            if ($field -match "pid") {
                $field = $field -replace "pid:",""
                write-host "Checking pid: $field"
                if ($field -match "\d{9}") {
                    $validfield += $true
                    write-host "pid verified" -ForegroundColor Green
                }  
                else {
                    write-host "NOT valid" -ForegroundColor Red
                    $validfield += $false
                }                 
            }
<# ignored      if ($field -match "cid") {
                $field = $field -replace "cid:",""
                if (!($field -contains "")) {
                  $invalidfield = $true
                }              
            }
#>                                   
        }
        if ($validfield -join " " -match $false) {
            $verifiedinvalidpassports++
            Write-Host "Person $i NOT verified" -BackgroundColor Red
        }
        elseif ($validfield -join " " -notmatch $false) {
            $verifiedvalidpassports++
            Write-Host "Person $i verified" -BackgroundColor Green
        }

            
    }
    Else {
        $invalidpassports++
    }
    $i++
}

$verifiedinvalidpassports = $verifiedinvalidpassports+1
$verifiedvalidpassports = $verifiedvalidpassports-1

Write-Host "Valid passports: $validpassports" -ForegroundColor Green
Write-Host "Invalid passports $invalidpassports" -ForegroundColor Green
Write-Host "Verified Valid passports: $verifiedvalidpassports" -ForegroundColor Green
Write-Host "Verified Invalid passports $verifiedinvalidpassports" -ForegroundColor Green