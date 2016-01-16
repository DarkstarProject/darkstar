-----------------------------------------
--    ID: 4896
--    Fire Spirit Pact
--    Teaches the summoning magicFire Spirit
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(288);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(288);
end;
