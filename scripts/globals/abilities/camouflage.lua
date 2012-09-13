-----------------------------------
-- Ability: Camouflage
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)

	duration = math.random(30, 300);
	duration = math.random(30, 300);
	duration = math.random(30, 300);

	if (target:getEquipID(5) == 14224) then -- Hunter's Jerkin
		duration = duration * 1.3;
	elseif (target:getEquipID(5) == 15571) then -- Hunter's Jerkin +1
		duration = duration * 1.5;
	end
	player:addStatusEffect(EFFECT_CAMOUFLAGE,1,0,math.floor(duration));
end;