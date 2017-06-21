-----------------------------------------
--    ID: 4774
--    Scroll of Thunder III
--    Teaches the black magic Thunder III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(166);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(166);
end;