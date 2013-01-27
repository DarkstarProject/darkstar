------------------------
--    Moonlight     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	local lvl = attacker:getSkillLevel(11); --get club skill
	local damage = (lvl/9) - 1;
	local damagemod = damage * ((50+(attacker:getTP()*0.5))/100);
	return 1, 0, damagemod;
end
