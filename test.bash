#!/bin/bash

ng () {
         echo ${1}行目が違うよ
         res=1

}

res=0

out=$(echo "5 + 1"| ./sisoku)
[ "${out}" = 6.0 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

