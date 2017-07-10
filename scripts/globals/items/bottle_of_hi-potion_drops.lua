-----------------------------------------
-- ID: 5328
-- Item: Hi-Potion Drop
-- Item Effect: Restores 110 HP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        result = 111;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addHP(110*ITEM_POWER);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,300);
end;