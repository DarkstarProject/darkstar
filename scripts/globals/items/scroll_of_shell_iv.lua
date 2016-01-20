-----------------------------------------
--    ID: 4659
--    Scroll of Shell IV
--    Teaches the white magic Shell IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(51);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(51);
end;