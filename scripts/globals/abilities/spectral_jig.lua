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
require("scripts/globals/utils");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
   return 0,0;
end;

function onUseAbility(player,target,ability)
    local baseDuration = 180;
    local durationMultiplier = 1.0 + utils.clamp(player:getMod(MOD_JIG_DURATION), 0, 50) / 100;
    local finalDuration = math.floor(baseDuration * durationMultiplier * SNEAK_INVIS_DURATION_MULTIPLIER);

    if (player:hasStatusEffect(dsp.effects.SNEAK) == false) then
        player:addStatusEffect(dsp.effects.SNEAK,0,10,finalDuration);
        player:addStatusEffect(dsp.effects.INVISIBLE,0,10,finalDuration);
        ability:setMsg(msgBasic.SPECTRAL_JIG); -- Gains the effect of sneak and invisible
    else
        ability:setMsg(msgBasic.NO_EFFECT); -- no effect on player.
    end

    return 1;
end;
