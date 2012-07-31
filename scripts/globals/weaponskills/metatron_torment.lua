-----------------------------------	
-- Metatron Torment	
-- Hand-to-Hand Skill level: 5 Description: Delivers a threefold attack. Damage varies wit weapon skill	
-- Great Axe Weapon Skill	
-- Skill Level: N/A	
-- Lowers target's defense. Additional effect: temporarily lowers damage taken from enemies.	
-- Defense Down effect is 18.5%, 1 minute duration.	
-- Damage reduced is 20.4% or 52/256.	
-- Lasts 20 seconds at 100TP, 40 seconds at 200TP and 60 seconds at 300TP.	
-- Available only when equipped with the Relic Weapons Abaddon Killer (Dynamis use only) or Bravura.	
-- Also available as a Latent effect on Barbarus Bhuj	
-- Since these Relic Weapons are only available to Warriors, only Warriors may use this Weapon Skill.	
-- Aligned with the Flame Gorget & Light Gorget.	
-- Aligned with the Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:60%	
-- 100%TP    200%TP    300%TP	
-- 2.75      2.75      2.75	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 2.75; ftp200 = 2.75; ftp300 = 2.75;
	str_wsc = 0.6; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);

	if damage > 0 then
		target:addStatusEffect(EFFECT_DEFENSE_DOWN, 18.5, 0, 120);
	end
	
	return tpHits, extraHits, damage;
	
end	
