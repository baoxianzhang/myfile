#! /usr/bin/env sh
svn st | awk '{if ( $1 == "?" ) { print $2 }}' | xargs svn add
