-----------------------------------------
--    ID: 4967
--    Scroll of Yurin: Ichi
--    Teaches the ninjutsu Yurin: Ichi
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(508);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(508);
end;