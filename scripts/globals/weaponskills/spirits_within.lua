-----------------------------------		
-- Spirits Within		
-- Sword weapon skill		
-- Spirits Within Sword Weapon Skill		
-- TrolandAdded by Troland		
-- Skill Level: 175		
-- Delivers an unavoidable attack. Damage varies with HP and TP.		
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.		
-- Element: None		
-- Modifiers: HP:		
-- 100%TP    200%TP    300%TP		
-- 1/8       3/16      15/32		
-----------------------------------		
		
require("scripts/globals/status");		
require("scripts/globals/settings");		
require("scripts/globals/weaponskills");		
-----------------------------------		
		
function OnUseWeaponSkill(player, target, wsID)		
	D = player:getWeaponDmg();	
	HP = player:getHP();
	TP = player:getTP();
		
	if (TP == 300) then	
		WSC = HP * 0.46875;
	elseif (TP >= 200) then	
		WSC = HP * ((TP - 200) / (100 / (0.46875 - 0.1875)));
	elseif (TP >= 100) then	
		WSC = HP * ((TP - 100) / (100 / (0.1875 - 0.125)));
	end	
		
	damage = math.floor(D + WSC);
	
	return 1, 0, damage;
		
end		
