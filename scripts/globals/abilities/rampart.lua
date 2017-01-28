-----------------------------------
-- Ability: Rampart
-- Grants a Magic Shield effect and enhances defense for party members within area of effect.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
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
    local duration = 30 + player:getMod(MOD_RAMPART_DURATION);
    local vit = player:getStat(MOD_VIT);
    local subpower = vit*2;

    target:addStatusEffect(EFFECT_MAGIC_SHIELD, 4, 0, duration, subpower);

end;