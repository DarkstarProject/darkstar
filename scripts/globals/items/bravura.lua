-----------------------------------------
-- ID: 18294
-- Bravura
-- Additional Effect: Evasion Down -30, 40 second Duration
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_EVASION_DOWN)
        if (not target:hasStatusEffect(EFFECT_EVASION_DOWN)) then
            target:addStatusEffect(EFFECT_EVASION_DOWN, 30, 0, 40);
        end
        return SUBEFFECT_DEFENSE_DOWN, 160, EFFECT_EVASION_DOWN;
    end
end;