#!/bin/bash

check(){
    str1="/ip dns static add regexp=\"^(.*\\\.)?"
    str2=$(echo $1 | sed 's/\(.*\)\./\1\\\\./')
    str3="\\$\" type=FWD forward-to=\$gfwdns comment=gfw"
    echo "$str1$str2$str3" >> "dns.rsc"
}

cat $1 | while read line
do
  check $line;
done;