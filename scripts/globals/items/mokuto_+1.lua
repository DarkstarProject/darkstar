-----------------------------------------
-- ID: 16925
-- Item: Mokuto +1
-- Additional Effect: Silence
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_SILENCE, 10, 0, 30);
        return SUBEFFECT_SILENCE, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_SILENCE;
    end
end;