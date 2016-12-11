# Take out the file extension from the arguments.
# The remaining arguments are the command to run.
$fileExtension, $newArgs = $args

# Create a temporary directory by asking for a temp file, removing it,
# and using that name for the temporary directory.
$tempDir = [System.IO.Path]::GetTempFileName()
Remove-Item $tempDir
new-item -type directory -path $tempDir

$tempFile = "$tempDir/file$fileExtension"

# Read stdin to the temporary file
[Console]::In > "$tempFile"

# Call the command with the temporary file.
& $newArgs $tempFile

# Clean up the temporary directory
Remove-Item "$tempDir" -recurse
