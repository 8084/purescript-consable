module Data.Consable
       ( class Consable
       , cons
       , fromFoldableR
       , fromFoldableL
       )
where

import Data.Array as A
import Data.List as L
import Data.List.Lazy as LL
import Data.CatQueue as CQ
import Data.CatList as CL
import Data.Sequence as S
import Data.Foldable
import Prelude (flip)


class Consable t where
  cons :: forall a. a -> t a -> t a


-- | Conversion from `Foldable` to `Consable` using `foldr`.
-- |
-- | ```
-- | fromFoldableR [] [1,2,3,4]  == [1,2,3,4]
-- | fromFoldableR [5] [1,2,3,4] == [1,2,3,4,5]
-- | ```
fromFoldableR :: forall f c a.
                 Foldable f => Consable c => c a -> f a -> c a
fromFoldableR = foldr cons


-- | Conversion from `Foldable` to `Consable` using `foldl`.
-- |
-- | ```
-- | fromFoldableL [] [1,2,3,4]  == [4,3,2,1]
-- | fromFoldableL [0] [1,2,3,4] == [4,3,2,1,0]
-- | ```
fromFoldableL :: forall f c a.
                 Foldable f => Consable c => c a -> f a -> c a
fromFoldableL = foldl (flip cons)


instance consableArray :: Consable Array where
  cons = A.cons

instance consableList :: Consable L.List where
  cons = L.Cons

instance consableLazyList :: Consable LL.List where
  cons = LL.cons

instance consableCatQueue :: Consable CQ.CatQueue where
  cons = CQ.cons

instance consableCatList :: Consable CL.CatList where
  cons = CL.cons

instance consableSeq :: Consable S.Seq where
  cons = S.cons
