-----------------------------------------
-- ID: 18110
-- Item: Mezraq
-- Additional Effect: Impairs evasion
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_ICE,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_EVASION_DOWN)
        if (not target:hasStatusEffect(EFFECT_EVASION_DOWN)) then
            target:addStatusEffect(EFFECT_EVASION_DOWN, 10, 0, 60);
        end
        return SUBEFFECT_DEFENSE_DOWN, 160, EFFECT_EVASION_DOWN; -- I believe this is the correct subeffect animation.
    end
end;