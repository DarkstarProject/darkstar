-----------------------------------------
-- ID: 18300
-- Gungnir
-- Additional Effect: Defense Down -17%, 40 second duration
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
        target:delStatusEffect(EFFECT_DEFENSE_DOWN);
        if (not target:hasStatusEffect(EFFECT_DEFENSE_DOWN)) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 17, 0, 40);
        end
        return SUBEFFECT_DEFENSE_DOWN, 160, EFFECT_DEFENSE_DOWN;
    end
end;