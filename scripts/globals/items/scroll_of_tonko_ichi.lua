-----------------------------------------
--    ID: 4961
--    Scroll of Tonko: Ichi
--    Teaches the ninjutsu Tonko: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(353);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(353);
end;