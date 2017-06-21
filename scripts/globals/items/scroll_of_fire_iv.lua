-----------------------------------------
--    ID: 4755
--    Scroll of Fire IV
--    Teaches the black magic Fire IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(147);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(147);
end;