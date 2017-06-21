-----------------------------------------
--    ID: 4868
--    Scroll of Dispel
--    Teaches the black magic Dispel
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(260);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(260);
end;