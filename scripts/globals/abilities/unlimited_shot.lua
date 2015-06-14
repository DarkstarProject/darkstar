-----------------------------------
-- Ability: Unlimited Shot
-- Allows you to perform your next ranged attack without using ammunition.
-- Obtained: Ranger Level 51
-- Recast Time: 3:00
-- Duration: 1:00 or One Successful Ranged Attack.
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
    player:addStatusEffect(EFFECT_UNLIMITED_SHOT,1,0,60);
end;