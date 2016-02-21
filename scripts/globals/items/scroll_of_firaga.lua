-----------------------------------------
--    ID: 4782
--    Scroll of Firaga
--    Teaches the black magic Firaga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(174);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(174);
end;