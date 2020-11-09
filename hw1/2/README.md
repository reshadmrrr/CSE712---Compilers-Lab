# Problem 

Write the grammar spec in Bison for the given problem. Consider a tiny
programming language like below:

```
i n t myFun( i n t g ) {
i n t k = g ∗ 10!
return k + 3 !
}
myFun ( 8 ) !
myFun ( 1 0 ) !
```
Based on this, you will need to develop a grammar to handle:
Program (this is made of of statements)
Statements (either a single statement, or statements followed by a single statement)
Statement (variable declarations, function declarations, expressions, return (followed by
an expression))
Block (statements surrounded by curly braces)
Variable declarations (with and without an assignment)
Function declarations
Function declaration arguments
identifies
Numeric values
Expressions (assignment, function calls, basic math)
As a first pass, work on developing your grammar, and simply print out success messages
once finding things.