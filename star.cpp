#include <iostream>

int main() {
    int n;
    std::cout << "Enter the number of rows for the star pattern: ";
    std::cin >> n;

    // Outer loop for rows
    for (int i = 1; i <= n; ++i) {
        // Print spaces for the left half of the star
        for (int j = 1; j <= n - i; ++j) {
            std::cout << " ";
        }

        // Print asterisks for the middle of the star
        for (int j = 1; j <= 2 * i - 1; ++j) {
            std::cout << "*";
        }

        // Move to the next line
        std::cout << std::endl;
    }

    return 0;
}

