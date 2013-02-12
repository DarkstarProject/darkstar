-----------------------------------------
-- ID: 4124
-- Item: Max-Potion
-- Item Effect: Restores 500 HP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
        if (target:hasStatusEffect(EFFECT_MEDICINE)) then
                result = 111;
        end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local heal = 500*ITEM_POWER
    target:addHP(heal);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);

    target:messageBasic(24,0,heal);
end;