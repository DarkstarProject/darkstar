-----------------------------------------
--    ID: 4937
--    Scroll of Doton: Ichi
--    Teaches the ninjutsu Doton: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(329);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(329);
end;