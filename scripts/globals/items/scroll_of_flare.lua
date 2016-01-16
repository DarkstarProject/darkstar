-----------------------------------------
--    ID: 4812
--    Scroll of Flare
--    Teaches the black magic Flare
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(204);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(204);
end;