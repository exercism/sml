## Setup

You will need an SML interpreter to solve these problems. There are several popular implementations
[MLton](http://mlton.org/), [SML/NJ](http://www.smlnj.org/), and [PolyML](http://www.polyml.org/). 

For reference, the problems are being developed and tested using PolyML. (Note: currently PolyML is required to properly run tests)

#### How to test changes
 
1. Go into the problem directory

 ```
 cd <path-to-xsml-project/exercises/accumulate
 ```

2. Create your solution to the problem named after the problem itself (in this case `accumulate.sml`)
3. Run the test file using PolyML

 ```
 poly -q < test_accumulate.sml
 ```

4. Verify that tests pass

 ```
 Applying a function the empty-list ([]) does nothing: PASSED
 Applying a square function to [1,2,3] produces [1,4,9]: PASSED
 Applying a cube function to[1,2,3] produces [1,8,27]: PASSED
 Applying an increment function to [1,2,3] produces [2,3,4]: PASSED
 Applying an decrement function to [1,2,3] produces [0,1,2]: PASSED
 ALL TESTS PASSED%
 ```

5. Correct any failing tests 

 ```
 Applying a function the empty-list ([]) does nothing: PASSED
 Applying a square function to [1,2,3] produces [1,4,9]: FAILED
 Applying a cube function to[1,2,3] produces [1,8,27]: PASSED
 Applying an increment function to [1,2,3] produces [2,3,4]: PASSED
 Applying an decrement function to [1,2,3] produces [0,1,2]: PASSED
 1 TEST(S) FAILED%
 ```
