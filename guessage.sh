#!/bin/bash

read -p "Hello! Please enter your name: " name

age_guess=$((RANDOM % 50 + 20))  # Random age between 20 and 69

echo "Hello, $name! I'm going to guess your age. Hmm... I think you are $age_guess years old."
