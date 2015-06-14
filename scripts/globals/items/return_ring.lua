-----------------------------------------
-- ID: 15542
-- Teleport Return Ring
-- Enchantment: "Outpost Warp"
-----------------------------------------

require("scripts/globals/zone");
require("scripts/globals/status");
require("scripts/globals/conquest");
require("scripts/globals/teleports");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    local region = target:getCurrentRegion();

    if (hasOutpost(target, target:getCurrentRegion()) == REGION_UNKNOWN or GetRegionOwner(region) ~= target:getNation()) then
        result = MSGBASIC_CANT_BE_USED_IN_AREA;
    end

    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_HOMING,0,1);
end;