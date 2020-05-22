$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.CheckedListBox]$CheckedListBox1 = $null
[System.Windows.Forms.Button]$Button1 = $null
function InitializeComponent
{
$CheckedListBox1 = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Form1.SuspendLayout()
#
#CheckedListBox1
#
$CheckedListBox1.FormattingEnabled = $true
$CheckedListBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]2))
$CheckedListBox1.Name = [System.String]'CheckedListBox1'
$CheckedListBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]579,[System.Int32]466))
$CheckedListBox1.TabIndex = [System.Int32]0
$CheckedListBox1.UseCompatibleTextRendering = $true
#
#Button1
#
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]226,[System.Int32]474))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]135,[System.Int32]42))
$Button1.TabIndex = [System.Int32]1
$Button1.Text = [System.String]'Start'
$Button1.UseCompatibleTextRendering = $true
$Button1.UseVisualStyleBackColor = $true
$Button1.add_Click($Button1_Click)
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]603,[System.Int32]528))
$Form1.Controls.Add($Button1)
$Form1.Controls.Add($CheckedListBox1)
$Form1.Text = [System.String]'Form1'
$Form1.add_Load($Form1_Load)
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name CheckedListBox1 -Value $CheckedListBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
}
. InitializeComponent
