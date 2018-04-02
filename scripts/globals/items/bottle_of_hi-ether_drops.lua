-----------------------------------------
-- ID: 5358
-- Item: Hi-Ether Drop
-- Item Effect: Restores 45 MP
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:addMP(45*ITEM_POWER);
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,300);
end;
