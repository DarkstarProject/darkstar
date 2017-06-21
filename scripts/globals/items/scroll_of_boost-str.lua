-----------------------------------------
--    ID: 5094
--    Scroll of Boost-STR
--    Teaches the white magic Boost-STR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(479);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(479);
end;