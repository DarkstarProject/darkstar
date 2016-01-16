-----------------------------------------
--    ID: 4780
--    Scroll of Water IV
--    Teaches the black magic Water IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(172);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(172);
end;