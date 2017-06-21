-----------------------------------------
--    ID: 4970
--    Scroll of Gekka: Ichi
--    Teaches the ninjutsu Gekka: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(505);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(505);
end;