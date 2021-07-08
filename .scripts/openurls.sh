#!/bin/sh

regex='(((http|https|ftp|gopher)|mailto)[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | dmenu -p "Open:" -l 15) || exit
brave "$url"
