$DRY_RUN = $false # TRUE = do not perform any changes, only simulate actions; FALSE = delete files permanently.

$DAYS_OLD_DOWNLOADS = 15 # Number of days to consider a download "old".
$MOVE_INSTEAD_DELETE = $false # TRUE = move files to $OLD_FOLDER_NAME folder instead of deleting; FALSE = delete files permanently.
$OLD_FOLDER_NAME = "_OLD" # Name of the folder where old files will be moved if $MOVE_INSTEAD_DELETE is true.

$LOG_DIR = ".\logs"