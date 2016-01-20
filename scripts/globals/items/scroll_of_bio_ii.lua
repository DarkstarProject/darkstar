-----------------------------------------
--    ID: 4839
--    Scroll of Bio II
--    Teaches the black magic Bio II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(231);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(231);
end;