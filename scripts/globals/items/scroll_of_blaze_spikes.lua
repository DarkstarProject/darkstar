-----------------------------------------
--    ID: 4857
--    Scroll of Blaze Spikes
--    Teaches the black magic Blaze Spikes
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(249);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(249);
end;