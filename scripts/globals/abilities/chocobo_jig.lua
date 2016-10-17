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
   local duration = 120 + player:getMod(MOD_CHOCO_JIG_DURATION);
   player:addStatusEffect(EFFECT_QUICKENING,25,0,duration);
end;