-----------------------------------------
--    ID: 5343
--    Azouph Fireflies
--  Transports the user to Azouph Isle
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/teleports");
-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    if (target:getZone() == 69) then
        return 0;
    end
    return 56;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,FIREFLIES_AZOUPH,0,1);
end;
