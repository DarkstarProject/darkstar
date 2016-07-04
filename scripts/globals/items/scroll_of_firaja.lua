-----------------------------------------
--    ID: 4890
--    Scroll of Firaja
--    Teaches the black magic Firaja
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(496);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(496);
end;