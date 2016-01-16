-----------------------------------------
--    ID: 4885
--    Scroll of Dread Spikes
--    Teaches the black magic Dread Spikes
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(277);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(277);
end;