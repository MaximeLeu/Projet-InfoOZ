declare
fun{Head Partition}
   case Partition of nil then nil
   [] H|T then H
   end
end

{Browse {Head [1 2 3]}}

declare
fun{Tail Partition}
   case Partition of nil then nil
   [] H|T then T
   end
end

{Browse {Tail [1 2 3]}}


