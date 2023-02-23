'##################################################################
' Script VBS de mapeamento de pasta,impresora,atalho e boas vindas
'            Autor: Maxswell Sousa Diniz                          
'               Data: 22/02/2023                                  
'##################################################################




'@CODEPAGE 65001
On Error Resume Next



' ABAIXO SE CRIA O MAPEAMENTO DAS PASTAS PARA O USUÁRIO

' Map network folders
Set objNetwork = CreateObject("WScript.Network")
objNetwork.MapNetworkDrive "A:", "\\NomeServidor\nomePasta"
objNetwork.MapNetworkDrive "P:", "\\NomeServidor\NomePasta"
objNetwork.MapNetworkDrive "T:", "\\NomeServidor\NomePasta"
objNetwork.MapNetworkDrive "U:", "\\NomeServidor\NomePasta"



' ABAIXO SE MAPEIA AS IMPRESSORAS

' Map network printer
Set objNetwork = CreateObject("WScript.Network")
objNetwork.AddWindowsPrinterConnection "\\NomeServidor\Nomeimpressora1"
objNetwork.AddWindowsPrinterConnection "\\NomeServidor\Nomeimpressora2"





' CRIANDO ATALHO DE PASTAS OU LINK NA ÁREA DE TRABALHO


' Create shortcut on desktop
Set objShell = CreateObject("WScript.Shell")
strDesktop = objShell.SpecialFolders("Desktop")
Set objUrlShortcut = objShell.CreateShortcut(strDesktop & "\NomePasta.lnk")
objUrlShortcut.TargetPath = "\\NomeServidor\NomePasta"
objUrlShortcut.Save




' DANDO BOAS VINDAS AO USUÁRIO DE FORMAS DIFERENTE.


' Get the current time
dtmCurrentTime = Time()

' Determine whether it is morning, afternoon, or evening
If dtmCurrentTime >= #6:00:00 AM# And dtmCurrentTime < #12:00:00 PM# Then
    strGreeting = "Bom dia"
ElseIf dtmCurrentTime >= #12:00:00 PM# And dtmCurrentTime < #17:00:00 PM# Then
    strGreeting = "Boa tarde"
Else
    strGreeting = "Boa noite"
End If

' Get the user name
Set objNetwork = CreateObject("WScript.Network")
strUserName = objNetwork.UserName

' Display welcome message
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile("\\NomeServidor\welcome.txt", ForReading)
strText = objFile.ReadAll
objFile.Close
MsgBox strGreeting & ", " & strUserName & "! " & strText, vbInformation, "Bem-vindo ao grupo Diniz!"
