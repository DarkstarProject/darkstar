------------------------
--    Dagan     -- 
------------------------
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");

function OnUseWeaponSkill(player, target, wsID)
	local ftphp = fTP(player:getTP(),0.22,0.34,0.52);
	local ftpmp = fTP(player:getTP(),0.15,0.25,0.35);
	player:addHP(ftphp*player:getMaxHP());
	return 0,0,false,(ftpmp*player:getMaxMP());
end
