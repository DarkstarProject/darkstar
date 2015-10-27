-----------------------------------
-- Ability: Tenuto
-- If the next song you cast affects yourself, it will not subsequently be overwritten by other songs.
-- Obtained: Bard Level 83
-- Recast Time: 0:15
-- Duration: 1:00, or until next song is cast.
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

function onUseAbility(player, target, ability)
    player:addStatusEffect(EFFECT_TENUTO,0,0,60);
end;