------------------------
-- Weapon Break
-- G.Axe weapon skill
-- Skill: 175
-- Modifiers: STR:32%, VIT:32%
-- Lowers enemies Attack. Duration of effect varies with TP. (max40sec)
------------------------
require("/scripts/globals/settings");
require("/scripts/globals/weaponskills");
require("/scripts/globals/status");

function OnUseWeaponSkill(attacker, target, wsID)

	--ftp damage mods (for Damage Varies with TP; lines are calculated in the function
	ftp100 = 1.0; ftp200 = 1.0; ftp300 = 1.0;


	if(target:hasStatusEffect(EFFECT_ATTACK_DOWN) == false) then

		durationMod = fTP(attacker:getTP(),ftp100,ftp200,ftp300);
		duration = math.random(10,20*durationMod);

		target:addStatusEffect(EFFECT_ATTACK_DOWN,0,25,math.floor(duration));
	end

	numHits = 1;
	--wscs are in % so 0.2=20%
	str_wsc = 0.32; dex_wsc = 0.0; vit_wsc = 0.32; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	--critical mods, again in % (ONLY USE FOR CRITICAL HIT VARIES WITH TP)
	crit100 = 0.0; crit200=0.0; crit300=0.0;
	canCrit = false;
	--accuracy mods (ONLY USE FOR ACCURACY VARIES WITH TP) , should be the acc at those %s NOT the penalty values. Leave 0 if acc doesnt vary with tp.
	acc100 = 0.0; acc200=0.0; acc300=0.0;
	--attack multiplier (only some WSes use this, this varies the actual ratio value, see Tachi: Kasha) 1 is default.
	atkmulti = 1;

	damage = doPhysicalWeaponskill(attacker,target, numHits,  str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,  canCrit,crit100,crit200,crit300,  acc100,acc200,acc300,   atkmulti);

	return damage;
end
