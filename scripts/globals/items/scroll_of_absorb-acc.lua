-----------------------------------------
--    ID: 4886
--    Scroll of Absorb-ACC
--    Teaches the black magic Absorb-ACC
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(242);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(242);
end;