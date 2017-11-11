-----------------------------------------
-- ID: 13171
-- Reraise Gorget
--  This necklace functions in the same way as the spell Reraise II.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = 7200;
    target:delStatusEffect(EFFECT_RERAISE);
    target:addStatusEffect(EFFECT_RERAISE,2,0,duration);
    target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_RERAISE);
end;
