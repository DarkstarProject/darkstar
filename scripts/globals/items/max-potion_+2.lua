-----------------------------------------
-- ID: 4126
-- Item: Max-Potion +2
-- Item Effect: Restores 650 HP
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
        target:addHP(650*ITEM_POWER);
        target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;