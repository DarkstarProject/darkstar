-----------------------------------------
--    ID: 4901
--    Water Spirit Pact
--    Teaches the summoning magic Water Spirit
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(293);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(293);
end;
