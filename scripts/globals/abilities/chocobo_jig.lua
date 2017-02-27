-----------------------------------
-- Ability: Chocobo jig
-- Increases Movement Speed.
-- Obtained: Dancer Level 55
-- TP Required: 0
-- Recast Time: 1:00
-- Duration: 2:00
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
    local baseDuration = 120;
    local durationMultiplier = 1.0 + utils.clamp(player:getMod(MOD_JIG_DURATION), 0, 50) / 100;
    local finalDuration = math.floor(baseDuration * durationMultiplier);
    
    player:addStatusEffect(EFFECT_QUICKENING,20,0,finalDuration);
end;