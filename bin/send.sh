:

. ${0%/*}/env

SUBJECT="JOB"
BCC=""
CC=""

while getopts s:b:c: opt
do
	case $opt in
	's')
		SUBJECT=$OPTARG
		;;
	'b')
		BCC="-b $OPTARG"
		;;
	'c')
		CC="-c $OPTARG"
		;;
	esac
done
shift $((OPTIND-1))

query=$1
cmd="mutt -F ${0%/*}/offline -s $SUBJECT $BCC $CC horizons@ssd.jpl.nasa.gov"

[ "$query" ] && [ -s $query ] && {
	sed "s/__EMAIL__/$EMAIL/" $query | eval $cmd
	exit
	}
echo | eval $cmd
