-----------------------------------------
-- ID: 16910
-- Item: Mamushito
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_LIGHTNING,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_STUN, 1, 0, 3);
        return SUBEFFECT_STUN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_STUN;
    end
end;

