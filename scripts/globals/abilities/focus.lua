-----------------------------------
-- Ability:	Focus			 	 		 
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_FOCUS,1,0,120);
end;