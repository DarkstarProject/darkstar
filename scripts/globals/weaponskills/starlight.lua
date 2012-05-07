------------------------
--    Starlight     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	lvl = attacker:getSkillLevel(11); --get club skill
	damage = (lvl-10)/9;
	damagemod = damage * (attacker:getTP()/100);
	return damagemod;
end
