-----------------------------------------
--    ID: 4931
--    Scroll of Hyoton: Ichi
--    Teaches the ninjutsu Hyoton: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(323);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(323);
end;