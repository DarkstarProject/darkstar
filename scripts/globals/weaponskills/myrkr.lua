------------------------
--    Myrkr     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(attacker, target, wsID)
	local ftpmp = fTP(attacker:getTP(),0.2,0.4,0.6);
	return 1, 0, (ftpmp*attacker:getMaxMP());
end
