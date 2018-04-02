-----------------------------------------
--  ID: 4201
--  Item: Dexterity Potion
--  Dexterity 7
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
    target:addStatusEffect(dsp.effects.DEX_BOOST,7,0,180);
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,900);
end;
