------------------------
--    Dagan     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	ftphp = fTP(attacker:getTP(),0.22,0.34,0.52);
	ftpmp = fTP(attacker:getTP(),0.15,0.25,0.35);
	attacker:addHP(ftphp*attacker:getMaxHP());
	return (ftpmp*attacker:getMaxMP());
end
