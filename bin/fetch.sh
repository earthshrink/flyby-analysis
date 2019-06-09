:
. ${0%/*}/env

# response on stdout
fetchmail -UF -B 1 -m cat $MAILARGS
