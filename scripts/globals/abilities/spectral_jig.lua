-----------------------------------
-- Ability: Spectral jig
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
   return 0,0;
end;

function OnUseAbility(player, target, ability)

   local baseDuration = math.random(30,60);
   local finalDuration = baseDuration;
   local legs = target:getEquipID(SLOT_LEGS);
   local feet = target:getEquipID(SLOT_FEET);

   -- Reports have been changed from +30 sec to "extends duration by 100%"
   if(legs == 16360 or legs == 16361 or legs == 10728) then
      finalDuration = finalDuration + baseDuration;
   end
   if(feet == 15746 or feet == 15747 or feet == 11393 or feet == 11394) then
      finalDuration = finalDuration + baseDuration;
   end

   if(player:hasStatusEffect(EFFECT_SNEAK) == false) then
      player:addStatusEffect(EFFECT_SNEAK,0,10,finalDuration);
      player:addStatusEffect(EFFECT_INVISIBLE,0,10,finalDuration);
      ability:setMsg(532); -- Gains the effect of sneak and invisible
   else
      ability:setMsg(283); -- no effect on player.
   end

   return 1;
end;