-----------------------------------------
--    ID: 4818
--    Scroll of Quake
--    Teaches the black magic Quake
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(210);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(210);
end;