-----------------------------------------
-- ID: 5345
-- Item: Zhayolm Fireflies
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if (target:getZoneID() == 63) then
        return 0;
    end
    return 56;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,FIREFLIES_ZHAYOLM,0,1);
end;
