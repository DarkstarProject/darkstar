-----------------------------------
-- Ability: Chocobo jig
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

   -- Increases movement speed by 25% for 120s
   -- AF feet and Relic legs increase duration by 30s each
   local legs = player:getEquipID(SLOT_LEGS);
   local feet = player:getEquipID(SLOT_FEET);
   local duration = 120;
   if(legs == 16360 or legs == 16361 or legs == 10728) then
      duration = duration + 30;
   end
   if(feet == 15746 or feet == 15747 or feet == 11393 or feet == 11394) then
      duration = duration + 30;
   end
   player:addStatusEffect(EFFECT_QUICKENING,25,0,duration);
end;