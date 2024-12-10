#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Riku Kinjo
# SPDX-License-Identifier: BSD-3-Clause

ng () {
         echo ${1}行目に問題有
         res=1
}

res=0


#一般的な加算
out=$(echo "10 + 12"| ./sisoku)
[ "${out}" = 22 ]       || ng "$LINENO"

#4,6の置き換え
out=$(echo "60 + 4"| ./sisoku)
[ "${out}" = 77 ]       || ng "$LINENO"

#10未満の自動変換
out=$(echo "5 + 1"| ./sisoku)
[ "${out}" = 0 ]        || ng "$LINENO"

#256を超えた場合の警告文
out=$(echo "1234 + 5678"| ./sisoku)
[ "${out}" = error ]    || ng "$LINENO"

#最初に入れた数値と結果で変化が無い場合
out=$(echo "2 * 2 / 2"| ./sisoku)
[ "${out}" = 変化なし ] || ng "$LINENO"

out=$(echo "12"| ./sisoku)
[ "${out}" = 変化なし ] || ng "$LINENO"

#数値以外の計算
out=$(echo "A + B"| ./sisoku)
[ "$?" = 1 ]            || ng "$LINENO"
[ "${out}" = "" ]       || ng "$LINENO"



[ "${res}" = 0 ] && echo no problem
exit $res

