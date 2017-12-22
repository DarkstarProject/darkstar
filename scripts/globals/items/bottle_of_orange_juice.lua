-----------------------------------------
-- ID: 4422
-- Item: Orange Juice
-- Item Effect: Restores 30 MP over 1 minute and 30 seconds.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local power = 1;
    local legs = target:getEquipID(SLOT_LEGS);
    if (legs == 11966 or legs == 11968) then -- Dream Trousers +1 & Dream Pants +1
        power = power + 1;
    end
    if (not target:hasStatusEffect(EFFECT_REFRESH)) then
        target:addStatusEffect(EFFECT_REFRESH,power,3,90);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
