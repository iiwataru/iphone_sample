function CallAlertDialog()
{
    AlertDialog('called [AlertDialog()] from [CallAlertDialog()]');
}

function AlertDialog(message)
{
    alert(message);
}