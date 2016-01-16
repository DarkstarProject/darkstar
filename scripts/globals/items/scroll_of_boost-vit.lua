-----------------------------------------
--    ID: 5096
--    Scroll of Boost-VIT
--    Teaches the white magic Boost-VIT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(481);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(481);
end;