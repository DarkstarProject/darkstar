-----------------------------------
-- Ability: Accession
-- Allows avatars to use their full strength and allows summmoning of Odin and Alexander.
-- Obtained: Summoner Level 1
-- Recast Time: 1:00:00
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
    player:addStatusEffect(EFFECT_ASTRAL_FLOW,1,0,180);

    return EFFECT_ASTRAL_FLOW;
end;