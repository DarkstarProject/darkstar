-----------------------------------------
-- ID: 5254
-- Item: Hyper-Potion
-- Item Effect: Restores 250 HP
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
    target:messageBasic(msgBasic.RECOVERS_HP,0,target:addHP(250*ITEM_POWER));
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,300);
end;
