-----------------------------------------
--    ID: 5078
--    Scroll of Sentinel's Scherzo
--    Teaches the song Sentinel's Scherzo
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(470);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(470);
end;