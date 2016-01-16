-----------------------------------------
--    ID: 4964
--    Scroll of Monomi: Ichi
--    Teaches the ninjutsu Monomi: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(318);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(318);
end;