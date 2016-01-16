-----------------------------------------
--    ID: 4928
--    Scroll of Katon: Ichi
--    Teaches the ninjutsu Katon: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(320);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(320);
end;