-----------------------------------------
-- ID: 16742
-- Item: Poison Knife +1
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
        if (not target:hasStatusEffect(EFFECT_POISON)) then
            target:addStatusEffect(EFFECT_POISON, 4, 3, 30);
        end
        return SUBEFFECT_POISON, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;