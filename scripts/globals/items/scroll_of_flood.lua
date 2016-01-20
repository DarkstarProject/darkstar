-----------------------------------------
--    ID: 4822
--    Scroll of Flood
--    Teaches the black magic Flood
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(214);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(214);
end;