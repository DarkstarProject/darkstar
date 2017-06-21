-----------------------------------------
--    ID: 4696
--    Scroll of Barparalyzra
--    Teaches the white magic Barparalyzra
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(88);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(88);
end;