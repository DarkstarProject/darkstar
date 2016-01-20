-----------------------------------------
--    ID: 4672
--    Scroll of Barthunder
--    Teaches the white magic Barthunder
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(64);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(64);
end;