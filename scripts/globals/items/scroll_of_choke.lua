-----------------------------------------
--    ID: 4845
--    Scroll of Choke
--    Teaches the black magic Choke
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(237);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(237);
end;