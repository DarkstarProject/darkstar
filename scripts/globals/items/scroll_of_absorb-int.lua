-----------------------------------------
--    ID: 4878
--    Scroll of Absorb-INT
--    Teaches the black magic Absorb-INT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(270);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(270);
end;