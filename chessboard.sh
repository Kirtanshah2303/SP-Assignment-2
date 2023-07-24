#!/bin/bash

display_chessboard() {
    for ((row=0; row<8; row++)); do
        for ((col=0; col<8; col++)); do
            if (( (row + col) % 2 == 0 )); then
                echo -n "\033[47m " # white
            else
                echo -n "\033[40m " # black
            fi
        done
        echo   # Move to the next row
    done
}

display_chessboard
