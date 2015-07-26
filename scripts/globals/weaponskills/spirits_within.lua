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
require("scripts/globals/utils");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)
	
	local Hitpoint = player:getHP();
	local TP = player:getTP();
	local hp_param = 0;
	local params = {};
	params.numHits = 1;
	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function
	params.ftp100 = 0.125; params.ftp200 = 0.1875 ; params.ftp300 = 0.46875;
	--wscs are in % so 0.2=20%
	params.str_wsc = 0; params.dex_wsc = 0; params.vit_wsc = 0; params.agi_wsc = 0; params.int_wsc = 0; params.mnd_wsc = 0; params.chr_wsc = 0;
	--critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
	params.crit100 = 0; params.crit200= 0; params.crit300= 0;
	params.canCrit = false;
	--accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
	params.acc100 = 0; params.acc200 = 0; params.acc300 = 0;
	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	params.atkmulti = 1;
	
	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 0.125; params.ftp200 = 0.5; params.ftp300 = 1;
	end
		
	if (TP == 300) then
		hp_param = Hitpoint * params;-- 0.46875 @300 TP -- ADOULIN 1.000 @300 TP
	elseif (TP >= 200) then
		hp_param = Hitpoint * params;-- 0.18750 @200 TP -- ADOULIN 0.500 @200 TP
	elseif (TP >= 100) then
		hp_param = Hitpoint * params;-- 0.12500 @100 TP -- ADOULIN 0.125 @100 TP
	end

	local damage = target:breathDmgTaken(hp_param);
	damage = damage * WEAPON_SKILL_POWER
	return 1, 0, false, damage;

end;
