-----------------------------------------
--    ID: 6045
--    Geohelix Schema
--    Teaches the black magic Geohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(278);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(278);
end;