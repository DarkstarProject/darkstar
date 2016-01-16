-----------------------------------------
--    ID: 4657
--    Scroll of Shell II
--    Teaches the white magic Shell II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(49);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(49);
end;