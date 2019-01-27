module Test.Main where

import Prelude
import Data.Consable
import Test.Assert
import Effect


main :: Effect Unit
main = do
  assertEqual { expected: [1,2,3,4]
              , actual: fromFoldableR [] [1,2,3,4] }
  assertEqual { expected: [1,2,3,4,5]
              , actual: fromFoldableR [5] [1,2,3,4] }

  assertEqual { expected: [4,3,2,1]
              , actual: fromFoldableL [] [1,2,3,4] }
  assertEqual { expected: [4,3,2,1,0]
              , actual: fromFoldableL [0] [1,2,3,4] }
