-----------------------------------------
--    ID: 4793
--    Scroll of Aeroga II
--    Teaches the black magic Aeroga II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(185);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(185);
end;