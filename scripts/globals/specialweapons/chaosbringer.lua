-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------



function onSpecialWeaponKill(player, prevZone)
	swordKills = player:getVar("Blade_Of_Darkness_SwordKills");
	
if (swordKills < 100) then 
	swordKills = swordKills +1;
player:setVar("Blade_Of_Darkness_SwordKills", swordKills);
end
end;

