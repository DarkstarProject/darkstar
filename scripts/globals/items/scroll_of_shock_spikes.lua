-----------------------------------------
--    ID: 4859
--    Scroll of Shock Spikes
--    Teaches the black magic Shock Spikes
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(251);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(251);
end;