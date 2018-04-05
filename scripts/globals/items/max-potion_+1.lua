-----------------------------------------
-- ID: 4125
-- Item: Max-Potion +1
-- Item Effect: Restores 550 HP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    elseif (target:hasStatusEffect(dsp.effects.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:messageBasic(msgBasic.RECOVERS_HP,0,target:addHP(550*ITEM_POWER));
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,900);
end;
