-----------------------------------------
--    ID: 4965
--    Scroll of Aisha: Ichi
--    Teaches the ninjutsu Aisha: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(319);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(319);
end;