-----------------------------------------
-- ID: 15754
-- Item: Sprinter's Shoes
-- Item Effect: Quickening for 60 minutes
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_QUICKENING, 10, 0, 3600);
    target:messageBasic(msgBasic.GAINS_EFFECT_OF_STATUS, EFFECT_QUICKENING);
end;
