-----------------------------------------
-- ID: 28540
-- Warp Ring
--  Transports the user to their Home Point
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/teleports");
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:addStatusEffectEx(dsp.effects.TELEPORT,0,TELEPORT_WARP,0,1);
end;
