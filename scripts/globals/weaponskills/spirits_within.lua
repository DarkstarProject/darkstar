-----------------------------------
-- Spirits Within
-- Sword weapon skill
-- Spirits Within Sword Weapon Skill
-- TrolandAdded by Troland
-- Skill Level: 175
-- Delivers an unavoidable attack. Damage varies with HP and TP.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- Element: None
-- Modifiers: HP (Damage is calculated by TP Multiplier times current HP) 
-- Modifiers: HP:
-- 1000%TP    2000%TP    3000%TP
-- 4/32       6/32      15/32   (Old Values - 2008 )
-- 12.5% HP   50% HP    100% HP (New Values - ADOULIN)
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
require("scripts/globals/utils");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)
	local HP = player:getHP();
	local TP = player:getTP();
	local WSC = 0;
	if (TP == 3000) then
		WSC = HP * (15/32);
	elseif (TP >= 2000) then
		WSC = HP * (6/32);
	elseif (TP >= 1000) then
		WSC = HP * (4/32);
	end

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		-- Damage calculations changed based on: http://www.bg-wiki.com/bg/Spirits_Within http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6142188&viewfull=1#post6142188
		if (TP == 3000) then
		WSC = HP;
		elseif (TP >= 2000) then
		WSC = floor(HP * ( floor(0.72*TP) - 96 ) ÷ 256 )
		elseif (TP >= 1000) then
		WSC = floor(HP * ( floor(0.16*TP) + 16 ) ÷ 256 )
		end
	end

	local damage = target:breathDmgTaken(WSC);
	damage = damage * WEAPON_SKILL_POWER
	return 1, 0, false, damage;

end
