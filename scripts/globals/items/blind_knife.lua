-----------------------------------------
-- ID: 16471
-- Item: Blind knife
-- Additional Effect: Blindness
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_DARK,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_BLINDNESS);
        if (not target:hasStatusEffect(EFFECT_BLINDNESS)) then
            target:addStatusEffect(EFFECT_BLINDNESS, 10, 0, 30);
        end
        return SUBEFFECT_BLIND, 160, EFFECT_BLINDNESS;
    end
end;