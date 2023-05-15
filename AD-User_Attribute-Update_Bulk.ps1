# AD-User_Attribute-Update_Bulk

$ADUsers = Import-csv -Path C:\Path\To\Users.csv

forEach($User in $ADUsers){
    $Manager = $User.Manager
    $ADUser = Get-ADUser -Filter "SAMAccountName -eq '$($User.UserName)'"

    if($ADUser){
        
        Set-ADUser -Identity $ADUser -Title $User.Title -Department $User.Department -Manager $Manager
    }else{
        Write-Warning ("Failed to update "+ $($user.username))
    }
}


# Note - this will populate the CN of the Manager & manager input bleeds red in the ps console, but still applies properly
