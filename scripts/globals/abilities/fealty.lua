-----------------------------------
-- Ability: Fealty
-- Grants a powerful resistance to enfeebling magic.
-- Obtained: Paladin Level 75
-- Recast Time: 0:10:00
-- Duration: 0:01:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local power = player:getMerit(MERIT_FEALTY);

    player:addStatusEffect(EFFECT_FEALTY,power,0,60 + (power * 5));
end;