-----------------------------------
-- Guillotine    
-- Scythe weapon skill
-- Skill level: 200
-- Delivers a four-hit attack. Duration varies with TP.
-- Modifiers: STR:25% ; MND:25% 
-- 100%TP 	200%TP 	300%TP
-- 0.875	0.875	0.875
-----------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");
function OnUseWeaponSkill(player, target, wsID)
	numHits = 4;
	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function
	ftp100 = 0.875; ftp200 = 0.875; ftp300 = 0.875;
	--wscs are in % so 0.2=20%
	str_wsc = 0.25; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.25; chr_wsc = 0.0;
	--critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
	crit100 = 0.0; crit200=0.0; crit300=0.0;
	canCrit = false;
	--accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
	acc100 = 0; acc200=0; acc300=0;
	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkmulti = 1;
	
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target, numHits,  str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,  canCrit,crit100,crit200,crit300,  acc100,acc200,acc300,   atkmulti);
	
	if damage > 0 then
		tp = player:getTP();
		duration = (tp/100 * 30) + 30;
		if(target:hasStatusEffect(EFFECT_SILENCE) == false) then
			target:addStatusEffect(EFFECT_SILENCE, 1, 0, duration);
		end
	end	
	return tpHits, extraHits, damage;
end
