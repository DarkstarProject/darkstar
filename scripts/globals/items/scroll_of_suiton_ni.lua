-----------------------------------------
--    ID: 4944
--    Scroll of Suiton: Ni
--    Teaches the ninjutsu Suiton: Ni
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(336);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(336);
end;