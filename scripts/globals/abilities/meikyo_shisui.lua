-----------------------------------
-- Ability: Meikyo Shisui
-- Reduces cost of weapon skills.
-- Obtained: Samurai Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:30
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
    player:addStatusEffect(EFFECT_MEIKYO_SHISUI,1,0,30);
    player:addTP(3000);
end;