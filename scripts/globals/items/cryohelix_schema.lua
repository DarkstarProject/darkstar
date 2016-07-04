-----------------------------------------
--    ID: 6044
--    Cryohelix Schema
--    Teaches the black magic Cryohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(282);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(282);
end;