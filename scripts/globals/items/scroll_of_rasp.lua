-----------------------------------------
--    ID: 4846
--    Scroll of Rasp
--    Teaches the black magic Rasp
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(238);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(238);
end;