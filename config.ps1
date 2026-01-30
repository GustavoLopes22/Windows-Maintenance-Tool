$DRY_RUN = $false #true = do not perform any changes, only simulate actions; false = perform changes.

$DAYS_OLD_DOWNLOADS = 15 #Number of days to consider a download "old".
$MOVE_INSTEAD_DELETE = $false #true = move files to $OLD_FOLDER_NAME folder instead of deleting; false = delete files permanently.
$OLD_FOLDER_NAME = "_OLD"

$LOG_DIR = ".\logs"