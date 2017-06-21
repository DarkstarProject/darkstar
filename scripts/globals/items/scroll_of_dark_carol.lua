-----------------------------------------
--    ID: 5053
--    Scroll of Dark Carol
--    Teaches the song Dark Carol
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(445);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(445);
end;