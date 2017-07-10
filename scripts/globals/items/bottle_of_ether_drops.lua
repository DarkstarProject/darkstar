-----------------------------------------
-- ID: 5357
-- Item: Ether Drop
-- Item Effect: Restores 15 MP
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
    target:addMP(15*ITEM_POWER);
    target:addStatusEffect(EFFECT_MEDICINE,0,0,300);
end;