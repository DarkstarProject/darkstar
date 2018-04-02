-----------------------------------------
--  ID: 4258
--  Item: Red Drop
--  Strength 5
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
    target:addStatusEffect(dsp.effects.STR_BOOST,5,0,900);
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,3600);
end;
