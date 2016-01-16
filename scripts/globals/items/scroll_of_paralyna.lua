-----------------------------------------
--    ID: 4623
--    Scroll of Paralyna
--    Teaches the white magic Paralyna
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(15);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(15);
end;