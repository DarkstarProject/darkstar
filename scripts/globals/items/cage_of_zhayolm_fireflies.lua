-----------------------------------------
-- ID: 5345
-- Item: Zhayolm Fireflies
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");
-----------------------------------------

function onItemCheck(target)
    if (target:getZoneID() == 63) then
        return 0;
    end
    return 56;
end;

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.ZHAYOLM,0,1);
end;
