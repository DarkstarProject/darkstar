-----------------------------------------
-- ID: 4566
-- Item: Deathball
-- Food Effect: 3 Mins, All Races
-- Poison 2HP / 3Tic
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD)) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,180,4566);
    if (not target:hasStatusEffect(EFFECT.POISON)) then
        target:addStatusEffect(EFFECT.POISON,2,3,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
