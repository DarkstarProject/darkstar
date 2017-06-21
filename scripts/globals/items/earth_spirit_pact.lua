-----------------------------------------
--    ID: 4899
--    Earth Spirit Pact
--    Teaches the summoning magic Earth Spirit
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(291);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(291);
end;
