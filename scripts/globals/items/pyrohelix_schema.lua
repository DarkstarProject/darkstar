-----------------------------------------
--    ID: 6041
--    Pyrohelix Schema
--    Teaches the black magic Pyrohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(281);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(281);
end;