$aocyear = 2020
$aocday = "05"

Write-Host "Initializing Advent of Code Script..." -ForegroundColor Blue
Write-Host "The year is: $aocyear" -ForegroundColor Blue
Write-Host "We are solving day: $aocday" -ForegroundColor Blue

$puzzleinput = gc ".\2020\day-$aocday\input.txt"

function DoMath {
	param (
		[Char[]]
		$s,
		[Char]
		$low,
		[Char]
		$high,
		[Int]
		$max
	)
	$min = 0;
	$s | ForEach-Object {
		if ($_ -eq $low) {
			$max = [Int](($max - $min) / 2) + $min
		}
		else {
			$min = [Int](($max - $min) / 2) + $min
		}
	}
	return $min
}
#part 1

$puzzleinput | ForEach-Object {
	return (DoMath $_.ToCharArray()[0..7] 'F' 'B' 128) * 8 + (DoMath $_.ToCharArray()[7..10] 'L' 'R' 8)
} | measure-object -Maximum

#part 2
$prev = $null
$puzzleinput | ForEach-Object {
	return (DoMath $_.ToCharArray()[0..7] 'F' 'B' 128) * 8 + (DoMath $_.ToCharArray()[7..10] 'L' 'R' 8)
} | Sort-Object | ForEach-Object {
	if ($prev -ne $null -and $prev + 1 -ne $_) {
		Write-Host ($prev + 1)
	}
	$prev = $_
}
