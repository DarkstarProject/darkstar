-----------------------------------
-- Ability: Meditate
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	amount = 12;
	if(player:getMainJob()==12) then
		amount = 20;
	end
	--TODO: Meditate doesnt actually give an icon, it's not regain as such.
	player:addStatusEffect(EFFECT_REGAIN,20,3,15);
end;