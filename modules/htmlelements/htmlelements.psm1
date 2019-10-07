function Get-Site
{
    param (
        [string]$url = 'https://www.exchange.cz/'
    )

    return Invoke-WebRequest -Uri $url
}

function Calc-Elements
{

    param (

        [string]$url = 'https://www.exchange.cz/'

    )

    $content = Get-Site $url

    $count = ($content.Links.outerhtml | Select-String -Pattern "www", "http", "https" | Measure-Object -Line).Lines

    Write-Host "[$url] total links: $count"

    return $count


}

function Show-Elements
{

    param (

        [string]$url = 'https://www.exchange.cz/'

    )

    $content = Get-Site $url

    return $content.Links.outerhtml | Select-String -Pattern "www", "http", "https"


}