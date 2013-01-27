------------------------
--    Starlight     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	local lvl = attacker:getSkillLevel(11); --get club skill
	local damage = (lvl-10)/9;
	local damagemod = damage * (attacker:getTP()/100);
	return 1, 0, damagemod;
end
