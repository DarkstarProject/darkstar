-----------------------------------------
--    ID: 4962
--    Scroll of Tonko: Ichi
--    Teaches the ninjutsu Tonko: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(354);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(354);
end;