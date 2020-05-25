[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.CheckedListBox]$checkedListBox1 = $null
[System.Windows.Forms.Button]$button2 = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$checkedListBox1 = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$button2 = (New-Object -TypeName System.Windows.Forms.Button)
$Form1.SuspendLayout()
#
#checkedListBox1
#
$checkedListBox1.FormattingEnabled = $true
$checkedListBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$checkedListBox1.Name = [System.String]'checkedListBox1'
$checkedListBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]650,[System.Int32]441))
$checkedListBox1.TabIndex = [System.Int32]0
$checkedListBox1
#
#button2
#
$button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]247,[System.Int32]459))
$button2.Name = [System.String]'button2'
$button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]176,[System.Int32]56))
$button2.TabIndex = [System.Int32]1
$button2.Text = [System.String]'Start'
$button2.UseVisualStyleBackColor = $true
$button2.add_Click($button2_Click)
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]674,[System.Int32]534))
$Form1.Controls.Add($button2)
$Form1.Controls.Add($checkedListBox1)
$Form1.Name = [System.String]'Form1'
$Form1.add_Load($Form1_Load)
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name checkedListBox1 -Value $checkedListBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button2 -Value $button2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
