module Data.Consable
       ( class Consable
       , cons
       )
where

import Data.Array as A
import Data.List as L
import Data.List.Lazy as LL
import Data.CatQueue as CQ
import Data.CatList as CL

class Consable t where
  cons :: forall a. a -> t a -> t a


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
