-----------------------------------------
--  ID: 4262
--  Item: Purple Drop
--  Dexterity 5
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effect.MEDICINE)) then
        return dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.DEX_BOOST,5,0,900)
    target:addStatusEffect(dsp.effect.MEDICINE,0,0,3600)
end
