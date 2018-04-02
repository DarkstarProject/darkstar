-----------------------------------------
-- ID: 16012
-- Mamool Ja Earring
--  This earring functions in the same way as the spell Reraise III.
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 3600;
    target:delStatusEffect(dsp.effects.RERAISE);
    target:addStatusEffect(dsp.effects.RERAISE,3,0,duration);
end;
