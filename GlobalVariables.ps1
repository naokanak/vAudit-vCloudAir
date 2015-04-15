# You can change the following defaults by altering the below settings:
#


# Set the following to true to enable the setup wizard for first time run
$SetupWizard = $True


# Start of Settings
# Please Specify the address (and optional port) of the server to connect to [servername(:port)]
$Server = "vCloud Air"
# Would you like the report displayed in the local browser once completed ?
$DisplaytoScreen = $true
# Use the following item to define if an email report should be sent once completed
$SendEmail = $false
# Please Specify the SMTP server address (and optional port) [servername(:port)]
$SMTPSRV = "mysmtpserver.mydomain.local"
# Would you like to use SSL to send email?
$EmailSSL = $false
# Please specify the email address who will send the vCheck report
$EmailFrom = "me@mydomain.local"
# Please specify the email address(es) who will receive the vCheck report (separate multiple addresses with comma)
$EmailTo = "me@mydomain.local"
# Please specify the email address(es) who will be CCd to receive the vCheck report (separate multiple addresses with comma)
$EmailCc = ""
# Please specify an email subject
$EmailSubject = "$Server vCloud Air Audit"
# Send the report by e-mail even if it is empty?
$EmailReportEvenIfEmpty = $true
# If you would prefer the HTML file as an attachment then enable the following:
$SendAttachment = $false
# Set the style template to use.
$Style = "vCloudAir"
# Set the following setting to $true to see how long each Plugin takes to run as part of the report
$TimeToRun = $true
# Report an plugins that take longer than the following amount of seconds
$PluginSeconds = 30
# End of Settings

# End of Global Variables
