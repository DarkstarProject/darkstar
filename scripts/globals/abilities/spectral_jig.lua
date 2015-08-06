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

   local baseDuration = math.random(30,90);
   local finalDuration = baseDuration;
   local legs = target:getEquipID(SLOT_LEGS);
   local feet = target:getEquipID(SLOT_FEET);

   local durationMultiplier = 1.0 + (player:getMod(MOD_SPECTRAL_JIG)/100);
   finalDuration = math.floor(baseDuration * durationMultiplier); 

   if (player:hasStatusEffect(EFFECT_SNEAK) == false) then
      player:addStatusEffect(EFFECT_SNEAK,0,10,finalDuration * SNEAK_INVIS_DURATION_MULTIPLIER);
      player:addStatusEffect(EFFECT_INVISIBLE,0,10,finalDuration * SNEAK_INVIS_DURATION_MULTIPLIER);
      ability:setMsg(532); -- Gains the effect of sneak and invisible
   else
      ability:setMsg(283); -- no effect on player.
   end

   return 1;
end;