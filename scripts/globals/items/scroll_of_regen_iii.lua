-----------------------------------------
--    ID: 4719
--    Scroll of Regen III
--    Teaches the white magic Regen III
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(111);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(111);
end;