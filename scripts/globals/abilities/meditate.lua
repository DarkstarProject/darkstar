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
	local tick = 15;
	local extratick = 0;
	local sHands = target:getEquipID(6);
	local sHead = target:getEquipID(4);
	if (sHands == 15113 or sHands == 14920) then
		extratick = 1;
	end
	if (sHead == 13868 or sHead == 15236) then
		extratick = extratick + 1;
	end
	if (extratick == 1) then
		extratick = math.random(1,2);
	elseif (extratick == 2) then
		extratick = math.random(2,3);
	end
	tick = tick + (extratick * 3);
	player:addStatusEffect(EFFECT_REGAIN,20,3,tick);
end;
