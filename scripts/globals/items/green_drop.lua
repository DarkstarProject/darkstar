-----------------------------------------
--  ID: 4260
--  Item: Green Drop
--  Agility 5
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.AGI_BOOST,5,0,900);
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,3600);
end;
