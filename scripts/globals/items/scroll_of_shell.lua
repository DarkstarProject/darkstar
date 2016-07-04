-----------------------------------------
--    ID: 4656
--    Scroll of Shell
--    Teaches the white magic Shell
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(48);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(48);
end;