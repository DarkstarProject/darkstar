-----------------------------------------
--    ID: 4756
--    Scroll of Fire V
--    Teaches the Black magic Fire V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(148);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(148);
end;