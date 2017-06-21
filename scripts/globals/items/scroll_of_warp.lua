-----------------------------------------
--    ID: 4869
--    Scroll of Warp
--    Teaches the black magic Warp
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(261);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(261);
end;