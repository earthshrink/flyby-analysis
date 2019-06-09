:
bin=${0%/*}
$bin/send.sh $*
$bin/check.sh
$bin/fetch.sh
