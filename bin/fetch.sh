:
. ${0%/*}/env

# response on stdout
fetchmail -F -B 1 -m cat $MAILARGS
