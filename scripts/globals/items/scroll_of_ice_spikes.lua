-----------------------------------------
--    ID: 4858
--    Scroll of Ice Spikes
--    Teaches the black magic Ice Spikes
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(250);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(250);
end;