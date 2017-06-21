-----------------------------------------
--    ID: 4655
--    Scroll of Protect V
--    Teaches the white magic Protect V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(47);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(47);
end;