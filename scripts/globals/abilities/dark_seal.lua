-----------------------------------
-- Ability: Dark Seal
-- Enhances the accuracy of your next dark magic spell.
-- Obtained: Dark Knight Level 75
-- Recast Time: 0:05:00
-- Duration: 1 Spell or 60 seconds, whichever occurs first.
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
    local merits = player:getMerit(MERIT_DARK_SEAL);
    player:addStatusEffect(EFFECT_DARK_SEAL,merits,0,60);
end;