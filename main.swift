//
// Bachelor of Software Engineering (Artificial Intelligence)
// Media Design School
// Auckland
// New Zealand
//
// (c) 2022 Media Design School
//
// File Name : main.swift
// Description : Sudoku Solver in Swift 
// Author : Rawinder Singh
// Mail : rawinder.singh@mds.ac.nz
//

// Game class declaration containing all member variables and functions 
// to perform the Sudoku Solver 
class Game{

  // Initial unsolved Sudoku puzzle stored in a multi-dimensional array 
  // Here the value "0" represents empty slots 
  var grid: [[Int]] = [[8, 0, 0, 4, 0, 6, 0, 0, 7], [0, 0, 0, 0, 0, 0, 4, 0, 0], [0, 1, 0, 0, 0, 0, 6, 5, 0], [5, 0, 9, 0, 3, 0, 7, 8, 0], [0, 0, 0, 0, 7, 0, 0, 0, 0], [0, 4, 8, 0, 2, 0, 1, 0, 3], [0, 5, 2, 0, 0, 0, 0, 9, 0], [0, 0, 1, 0, 0, 0, 0, 0, 0], [3, 0, 0, 9, 0, 2, 0, 0, 5]]

  // Function to Print the Sudoku Board 
  func PrintSudokuBoard(Array: [[Int]]){
  
  var iterator = 0 

    // For loop iterates through the multi-dimensional array and prints every element
    for i in Array{
       for j in i{
         
         if(iterator < 9){
           print(j, terminator: "")  
           iterator = iterator + 1 
           
           if(iterator == 9){
             print()
             iterator = 0
           }
        }
       } 
    }
}

// Function to perform a Validity check on whether an element of the grid array is safe to assign 
func ValidityCheck(Grid: [[Int]], Row: Int, Col: Int, Num: Int) -> (Bool){

  // Variables storing the intial row and col element 
  let StartRow = Row - Row % 3 
  let StartCol = Col - Col % 3 
  
  // Check across the Row
  for i in 1...9{
    if(Grid[Row][i - 1] == Num){
     return(false)  
    }
  }

  // Check across the Column 
  for j in 1...9{
    if(Grid[j - 1][Col] == Num){
     return(false)  
    } 
  }

  // Check across the 3*3 matrix 
  for i in 1...3{
    for j in 1...3{
      
      if(Grid[i + StartRow - 1][j + StartCol - 1] == Num){
        return(false) 
      }
    }
  }
  return(true)
  
}

// Function to solve the Sudoku Puzzle 
func Sudoku(Row: Int, Col: Int) -> (Bool){

  // Create modifiable variables of the Row and Column
  var Row = Row
  var Col = Col

  // Conditional check to see if the end has been reached
  if(Row == 9 - 1 && Col == 9){
    return(true)
  }

  // Conditional check to see if column value is 9. If so move to next row 
  if(Col == 9){
    Row = Row + 1
    Col = 0
  }

  // Conditional check to see if there is a value currently in the element at reviewal 
  if(g.grid[Row][Col] > 0){
    return(Sudoku(Row: Row, Col: Col + 1))
  }

  // Conditional check to see if a value between 1-9 is vaild to be replaced 
  for i in 1...9{
    if(ValidityCheck(Grid: g.grid, Row: Row, Col: Col, Num: i)){

      //  Assign the vaild num (i) into the correct position 
      g.grid[Row][Col] = i

      // Conditional check to see next possiblity within next column 
      if(Sudoku(Row: Row, Col: Col + 1)){
        return(true)
      }
    }

    // Remove the assigned num as it was not valid decision
    g.grid[Row][Col] = 0
  }
  return(false)
  
}
  
}

// Main execution code 

// Create an object of Game class 
let g = Game()

// Call the Sudoku Function to solve the puzzle
var game = g.Sudoku(Row: 0, Col: 0)

// Call the Print Sudoku Board function to print the solved puzzed to console 
g.PrintSudokuBoard(Array: g.grid)

// End 