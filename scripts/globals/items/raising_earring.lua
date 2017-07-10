-----------------------------------------
--  ID: 16003
--  Reraise Earring
--  This earring functions in the same way as the spell Reraise.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local duration = 2100;
    target:delStatusEffect(EFFECT_RERAISE);
    target:addStatusEffect(EFFECT_RERAISE,1,0,duration);
end;
