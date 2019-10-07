param(
    [string]$source
)

function Get-Stat()
{
    [CmdletBinding()]
    Param(
        [string]$text
    )

    $myTable = @{ }

    #$separators = (",", ".", " ")
    foreach ($word in $text -split '[\W+]' )
    {
        write-host "word = $word"
        if (-not $myTable.Contains($word))
        {
            $myTable.Add($word, 1)
        }
        else
        {
            $myTable.$word = $myTable.$word + 1
        }
    }

    return $myTable
}

Get-Stat($source)
