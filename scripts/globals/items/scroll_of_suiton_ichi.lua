-----------------------------------------
--    ID: 4943
--    Scroll of Suiton: Ichi
--    Teaches the ninjutsu Suiton: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(335);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(335);
end;