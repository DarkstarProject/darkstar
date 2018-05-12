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
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.WARP,0,1);
end;
