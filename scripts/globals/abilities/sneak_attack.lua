-----------------------------------

--	Sneak Attack

-----------------------------------
 


require("scripts/globals/settings");
require("scripts/globals/status");


function OnUseAbility(player, target, ability)
   player:addStatusEffect(EFFECT_SNEAK_ATTACK,1,0,59);
end;