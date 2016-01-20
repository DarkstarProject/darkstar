-----------------------------------------
--    ID: 6042
--    Hydrohelix Schema
--    Teaches the black magic Hydrohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(279);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(279);
end;