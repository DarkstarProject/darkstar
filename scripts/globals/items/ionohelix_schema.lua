-----------------------------------------
--    ID: 6043
--    Ionohelix Schema
--    Teaches the black magic Ionohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(283);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(283);
end;