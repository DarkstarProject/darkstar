-----------------------------------------
--    ID: 4952
--    Scroll of Hojo: Ichi
--    Teaches the ninjutsu Hojo: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(344);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(344);
end;