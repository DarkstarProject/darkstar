-----------------------------------------
--    ID: 4895
--    Scroll of Waterja
--    Teaches the Black magic Waterja
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(501);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(501);
end;