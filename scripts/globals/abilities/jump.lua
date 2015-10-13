-----------------------------------
-- Ability: Jump
-- Delivers a short jumping attack on a targeted enemy.
-- Obtained: Dragoon Level 10
-- Recast Time: 1:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    -- Under Spirit Surge, Jump also decreases target defence by 20% for 60 seconds
    if (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
        if (target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == false) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 20, 0, 60);
        end
    end
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
end;