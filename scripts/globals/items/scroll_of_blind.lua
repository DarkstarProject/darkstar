-----------------------------------------
--    ID: 4862
--    Scroll of Blind
--    Teaches the black magic Blind
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(254);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(254);
end;