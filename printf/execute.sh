#!/bin/sh

app=console_app

clear; rm -f *.o *.out
as -o $app.o main.s
ld -o $app.out $app.o
./$app.out
