-----------------------------------------
--    ID: 4705
--    Scroll of Temper
--    Teaches the white magic Temper
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(493);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(493);
end;