-----------------------------------------
-- ID: 14790
-- Reraise Earring
--  This earring functions in the same way as the spell Reraise.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 7200;
    target:delStatusEffect(dsp.effects.RERAISE);
    target:addStatusEffect(dsp.effects.RERAISE,1,0,duration);
    target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, dsp.effects.RERAISE);
end;
