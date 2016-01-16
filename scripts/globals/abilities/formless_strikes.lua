-----------------------------------
-- Ability: Formless Strikes
-- While in effect, melee attacks will not be considered physical damage. No effect on weapon skills.
-- Obtainable: Monk Level 75
-- Recast Time: 0:10:00
-- Duration: 0:03:00
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
   player:addStatusEffect(EFFECT_FORMLESS_STRIKES,1,0,180);
end;