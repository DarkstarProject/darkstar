-----------------------------------------
--    ID: 6047
--    Luminohelix Schema
--    Teaches the black magic Luminohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(285);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(285);
end;