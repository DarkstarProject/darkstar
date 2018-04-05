-----------------------------------------
-- ID: 4565
-- Item: Sobbing Fungus
-- Food Effect: 3 Mins, All Races
-- Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4565);
    if (not target:hasStatusEffect(dsp.effects.SILENCE)) then
        target:addStatusEffect(dsp.effects.SILENCE,1,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
