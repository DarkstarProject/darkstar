-----------------------------------------
-- ID: 16692
-- Item: Poison Baghnakhs +1
-- Additional Effect: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_POISON, 4, 3, 30);
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;