#include <iostream>

int main() {
    int low = 1; // Lower bound of the range
    int high = 100; // Upper bound of the range
    char response;

    std::cout << "Welcome to the Number Guessing Game!" << std::endl;
    std::cout << "Think of a number between 1 and 100, and I will try to guess it." << std::endl;

    do {
        int guess = (low + high) / 2;
        std::cout << "Is your number " << guess << "? (Enter 'H' for higher, 'L' for lower, or 'Y' for yes): ";
        std::cin >> response;

        if (response == 'H') {
            low = guess + 1;
        } else if (response == 'L') {
            high = guess - 1;
        } else if (response != 'Y') {
            std::cout << "Invalid input. Please enter 'H', 'L', or 'Y'." << std::endl;
        }
    } while (response != 'Y');

    std::cout << "Great! I guessed your number." << std::endl;

    return 0;
}
