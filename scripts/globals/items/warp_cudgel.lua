-----------------------------------------
-- ID: 17040
-- Warp Cudgel
-- Transports the user to their Home Point
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:addStatusEffectEx(dsp.effects.TELEPORT,0,TELEPORT_WARP,0,2);
end;
