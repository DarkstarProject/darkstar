-----------------------------------------
-- ID: 4127
-- Item: Max-Potion +3
-- Item Effect: Restores 700 HP
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
        target:addHP(700*ITEM_POWER);
        target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;