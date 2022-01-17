# enigma
Turing 2111 BE Mod 1 Final Solo Project

## To Encrypt a message
- Clone this repository onto your local machine.
- Open the message.txt file in your favorite text editor, and add the message you would like to encrypt. Note: special characters will be preserved, but not encrypted. Casing upon decryption will be entirely lowercase.
- Enter in your command line  
`$ ruby lib/encrypt.rb message.txt encrypted.txt `

- Your encrypted message can be found in the encrypted.txt file. Save the **key** and **date** returned in your terminal, as this is required for decryption.  

## To Decrypt a message
- Enter in your command line
`$ ruby lib/decrypt.rb encrypted.txt decrypted.txt key date `  
- Your decrypted message can be found in the decrypted.txt file.  

# Functionality: 3
- Encrypt and Decrypt methods are complete, and the encrypt/decrypt Command Line Interfaces are successfully implemented.
# Object Oriented Programming: 3.5
- Modules for #encrypt and #decrypt methods have been implemented, since they each perform a singular function and improve organization of the code. Modules for other helper methods in the Enigma class were left in the class, as they contain such few lines of code that implementing them in individual modules might not make sense. I welcome feedback regarding this decision.
# Ruby Conventions and Mechanics: 3
- Code is neat and properly indented, names follow convention and were chosen with ease of understandability in mind. Encrypt and Decrypt module methods are the long, however they implement other methods to prevent them from being unreasonable.
# Test Driven Development: 3
- All methods are tested, tests follow interaction pattern, and tests were written before methods. Methods were written utilizing tests, and test coverage metrics show 100%.
# Version Control
- > 30 commits in project, and pull requests were done when meaningful progress was achieved.
