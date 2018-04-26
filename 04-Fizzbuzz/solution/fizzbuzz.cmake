# From 1 to n
# If the number is a multiple of 3 prints "fizz"
# If the number is a multiple of 5 prints "buzz"
# If the number is a multiple of both prints "fizzbuzz"
# Else prints the number

function(fizzbuzz n)
  foreach(i RANGE 1 ${n})
    set(result "")
    math(EXPR fizz "${i} % 3")
    math(EXPR buzz "${i} % 5")
    if(NOT fizz)
      string(APPEND result "fizz")
    endif()
    if(NOT buzz)
      string(APPEND result "buzz")
    endif()
    if(NOT result)
      set(result "${i}")
    endif()
    message("${result}")
  endforeach()
endfunction()

fizzbuzz(15)
