$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.tests\.', '.'
. "$here\$sut"

Describe -Tags "Example" "Get-Stat" {

    It "words count" {
        (Get-Stat -text "some text").count | Should -Be 2
    }

    It "words count with commas" {
        (Get-Stat -text "some text? new, old! really? new again").count | Should -Be 6
    }

}