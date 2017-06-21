-----------------------------------------
--    ID: 5098
--    Scroll of Boost-INT
--    Teaches the white magic Boost-INT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(483);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(483);
end;