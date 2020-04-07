#!/usr/bin/bash
back_dir=/data
find $back_dir -mtime +2 |xargs rm -rf