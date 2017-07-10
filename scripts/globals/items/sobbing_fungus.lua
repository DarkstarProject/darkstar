-----------------------------------------
-- ID: 4565
-- Item: Sobbing Fungus
-- Food Effect: 3 Mins, All Races
-----------------------------------------
-- Silence
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,180,4565);
    if (target:hasStatusEffect(EFFECT_SILENCE) == false) then
        target:addStatusEffect(EFFECT_SILENCE,1,3,180);
    else
        target:messageBasic(423);
    end
end;
