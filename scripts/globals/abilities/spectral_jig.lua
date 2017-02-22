-----------------------------------
-- Ability: Spectral jig
-- Allows you to evade enemies by making you undetectable by sight and sound.
-- Obtained: Dancer Level 25
-- TP Required: 0
-- Recast Time: 30 seconds
-- Duration: 3 minutes
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
    local baseDuration = 180;
    local durationMultiplier = 1.0 + utils.clamp(player:getMod(MOD_JIG_DURATION), 0, 50) / 100;
    local finalDuration = math.floor(baseDuration * durationMultiplier * SNEAK_INVIS_DURATION_MULTIPLIER);

    if (player:hasStatusEffect(EFFECT_SNEAK) == false) then
        player:addStatusEffect(EFFECT_SNEAK,0,10,finalDuration);
        player:addStatusEffect(EFFECT_INVISIBLE,0,10,finalDuration);
        ability:setMsg(532); -- Gains the effect of sneak and invisible
    else
        ability:setMsg(283); -- no effect on player.
    end

    return 1;
end;
