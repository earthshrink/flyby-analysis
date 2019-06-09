:
. ${0%/*}/env

once=$1
while :
do
	fetchmail -c -k $MAILARGS && break
	[ $once ] && break
done
