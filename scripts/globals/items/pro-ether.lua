-----------------------------------------
-- ID: 4140
-- Item: Pro-Ether
-- Item Effect: Restores 250 MP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getMP() == target:getMaxMP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    elseif (target:hasStatusEffect(EFFECT_MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:messageBasic(msgBasic.RECOVERS_MP,0,target:addMP(250*ITEM_POWER));
    target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;
