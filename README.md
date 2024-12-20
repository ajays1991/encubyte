#TDD Kata Calculator

### Setup

- Clone the repository on local
- Ruby version is `$ 3.1.2`
- Run `$ bundle install` to install the dependecies.
- Run `$ rspec main.rb` to run the test suites

## KataCalculator

####Step by step implementation
                
1. Create a simple Kata calculator with a method Add(string) that takes a string. This method takes empty string and returns 0.
2. Change the Add(string) method that handles single numbers. It takes input "5" and returns 5.
3. Change the Add(string) method that handles multiple numbers seperated by ','. It takes "1,2,3" as input and returns 6.
4. Change the Add(string) method that handles new lines (/n) as delimeters. It takes "1,2\n3" as input and returns 6.
5. Change the Add(string) method that supports custom delimeters followed by '//' . It takes "//;\n1,2;3" as input and returns 6.
6. Change the Add(string) method that throws error if one of the number is negative. It takes "//;\n1,2;-3" as input and will raise error with error message "negative numbers not allowed -3".
7. Change the Add(string) method that remove number greater than 1000 from the list of numbers to sum It takes "//;\n1,2;3000" as input and returns 3.
8. Change the Add(string) method that handles delimiter of any length. It uses regular expression ""\\[(.*?)\\]" to find delimiter. It takes "//[***]\n1,2**3" as input and returns 
9. Change the Add(string) method that handles any number of delimiter. It uses regular expression ""\/\/(\\[.*\\])\\n" to find list of delimiters. It takes "//[*][%]\n1*2%3" as input and returns 6 .
                

Thanks