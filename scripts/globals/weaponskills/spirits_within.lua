-----------------------------------
-- Spirits Within
-- Sword weapon skill
-- Spirits Within Sword Weapon Skill
-- TrolandAdded by Troland
-- Skill Level: 175
-- Delivers an unavoidable attack. Damage varies with HP and TP.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- Element: None 
-- Modifiers: HP: (Damage is calculated by TP Multiplier times current HP) 
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
	if (TP == 300) then
		WSC = floor(HP * ( floor(0.72*TP) - 96 ) / 256 ); --0.46875 @300 TP
	elseif (TP >= 200) then
		WSC = floor(HP * ( floor(0.47*TP) - 46) / 256 ); --0.1875 @200 TP 
	elseif (TP >= 100) then
		WSC = floor(HP * ( floor(0.40*TP) - 8 ) / 256 );--0.125 @100 TP
	end

	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		-- Damage calculations changed based on: http://www.bg-wiki.com/bg/Spirits_Within http://www.bluegartr.com/threads/121610-Rehauled-Weapon-Skills-tier-lists?p=6142188&viewfull=1#post6142188
		if (TP == 300) then
		WSC =  (HP * ( floor(1.00*TP) - 44 ) / 256 );-- 1.00 @300 TP
		elseif (TP >= 200) then
		WSC = (HP * ( floor(0.72*TP) - 16 ) / 256 );-- 0.50 @200 TP
		elseif (TP >= 100) then
		WSC = (HP * ( floor(0.40*TP) - 8 ) / 256 );--0.125 @100 TP
		end
	end

	local damage = target:breathDmgTaken(WSC);
	damage = damage * WEAPON_SKILL_POWER
	return 1, 0, false, damage;

end
