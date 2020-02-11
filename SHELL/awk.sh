#!bin/bash

awk '/([0-9]|[a-z]|[A-Z])([0-9]|[a-z]|[A-Z])([0-9]|[a-z]|[A-Z])+\@([a-z][A-Z])+\.([a-z][A-Z])([a-z][A-Z])([a-z][A-Z])?/ {print $0}' pr1.txt 
