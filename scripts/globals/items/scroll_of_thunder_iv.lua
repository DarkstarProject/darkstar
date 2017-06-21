-----------------------------------------
--    ID: 4775
--    Scroll of Thunder IV
--    Teaches the black magic Thunder IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(167);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(167);
end;