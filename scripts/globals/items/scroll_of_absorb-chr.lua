-----------------------------------------
--    ID: 4880
--    Scroll of Absorb-CHR
--    Teaches the black magic Absorb-CHR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(272);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(272);
end;