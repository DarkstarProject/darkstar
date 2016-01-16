-----------------------------------------
--    ID: 4745
--    Scroll of Sneak
--    Teaches the white magic Sneak
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(137);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(137);
end;