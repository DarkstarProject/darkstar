--Contains all common weaponskill calculations including but not limited to:
-- fSTR
-- Alpha
-- Ratio -> cRatio
-- min/max cRatio
-- applications of fTP
-- applications of critical hits ('Critical hit rate varies with TP.')
-- applications of accuracy mods ('Accuracy varies with TP.')
-- applications of damage mods ('Damage varies with TP.')
-- performance of the actual WS (rand numbers, etc)
require("scripts/globals/status");

--params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti
function doPhysicalWeaponskill(attacker, target, params)
	--get fstr
	local fstr = fSTR(attacker:getStat(MOD_STR),target:getStat(MOD_VIT),attacker:getWeaponDmgRank());
	
	--apply WSC
	local weaponDamage = attacker:getWeaponDmg();

	if (attacker:getWeaponSkillType(0) == 1) then
		weaponDamage = (attacker:getWeaponDmg()-3) + ((attacker:getSkillLevel(1) * 0.11) + 3);
	else
		weaponDamage = attacker:getWeaponDmg();
	end
	
	local base = weaponDamage + fstr + 
		(attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc + 
		 attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc + 
		 attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc + 
		 attacker:getStat(MOD_CHR) * params.chr_wsc) * getAlpha(attacker:getMainLvl());
		 
	--Applying fTP multiplier
	local tp = attacker:getTP();
	if attacker:hasStatusEffect(EFFECT_SEKKANOKI) then
		tp = 100;
	end
	local ftp = fTP(tp,params.ftp100,params.ftp200,params.ftp300);
	
	local ignoredDef = 0;
	if (params.ignoresDef == not nil and params.ignoresDef == true) then
		ignoredDef = calculatedIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
	end
	
	--get cratio min and max
	local cratio = cRatio(((attacker:getStat(MOD_ATT) * params.atkmulti) / (target:getStat(MOD_DEF) - ignoredDef)), attacker:getMainLvl(), target:getMainLvl());
	local ccmin = 0;
	local ccmax = 0;
	local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
	local isSneakValid = attacker:hasStatusEffect(EFFECT_SNEAK_ATTACK);
	if(isSneakValid and not attacker:isBehind(target))then
		isSneakValid = false;
	end
	attacker:delStatusEffect(EFFECT_SNEAK_ATTACK);
	
	local ccritratio = 0;
	local critrate = 0;
	ccritratio = cCritRatio(((attacker:getStat(MOD_ATT) * params.atkmulti) / (target:getStat(MOD_DEF) - ignoredDef)) + 1, attacker:getMainLvl(), target:getMainLvl());

	if(params.canCrit) then --work out critical hit ratios, by +1ing 
		critrate = fTP(attacker:getTP(),params.crit100,params.crit200,params.crit300);
		--add on native crit hit rate (guesstimated, it actually follows an exponential curve)
		local nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; --assumes +0.5% crit rate per 1 dDEX
		nativecrit = nativecrit + (attacker:getMod(MOD_CRITHITRATE)/100);
		
		if(nativecrit > 0.2) then --caps!
			nativecrit = 0.2;
		elseif(nativecrit < 0.05) then
			nativecrit = 0.05;
		end
		critrate = critrate + nativecrit;
	end
	
	
	local dmg = base * ftp;  
	
	--Applying pDIF
	local double pdif = math.random((cratio[1]*1000),(cratio[2]*1000)); 
	pdif = pdif/1000; --multiplier set.
	
	--First hit has 95% acc always. Second hit + affected by hit rate.
	local double firsthit = math.random();
	local finaldmg = 0;
	local hitrate = getHitRate(attacker,target,true);
	if(params.acc100~=0) then
		--ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
		--print("Accuracy varies with TP.");
		hr = accVariesWithTP(getHitRate(attacker,target,false),attacker:getACC(),attacker:getTP(),params.acc100,params.acc200,params.acc300);
		hitrate = hr;
	end
	
	local tpHitsLanded = 0;
	local tpHits = 0;
	if (firsthit <= hitrate or isSneakValid or math.random() < attacker:getMod(MOD_ZANSHIN)/100) then
		if(params.canCrit or isSneakValid) then
			local double critchance = math.random();
			if(critchance <= critrate or hasMightyStrikes or isSneakValid) then --crit hit!
				local double cpdif = math.random((ccritratio[1]*1000),(ccritratio[2]*1000)); 
				cpdif = cpdif/1000; 
				finaldmg = dmg * cpdif;
				if(isSneakValid and attacker:getMainJob()==6) then --have to add on DEX bonus if on THF main
					finaldmg = finaldmg + (attacker:getStat(MOD_DEX) * ftp * cpdif) + souleaterBonus(attacker);
				end
			else
				finaldmg = dmg * pdif;
			end
		else
			finaldmg = dmg * pdif + souleaterBonus(attacker);
		end
		tpHitsLanded = 1;
	end
	tpHits = 1;
	if((attacker: getOffhandDmg() ~= 0) and (attacker:getOffhandDmg() > 0 or attacker:getWeaponSkillType(0)==1)) then

		local chance = math.random();
		if (chance<=hitrate or math.random() < attacker:getMod(MOD_ZANSHIN)/100 or isSneakValid) then --it hit
			pdif = math.random((cratio[1]*1000),(cratio[2]*1000));  --generate random PDIF
			pdif = pdif/1000; --multiplier set.
			if(params.canCrit) then
				critchance = math.random();
				if(critchance <= critrate or hasMightyStrikes) then --crit hit!
					cpdif = math.random((ccritratio[1]*1000),(ccritratio[2]*1000)); 
					cpdif = cpdif/1000; 
					finaldmg = finaldmg + base * cpdif + souleaterBonus(attacker);
				else
					finaldmg = finaldmg + base * pdif + souleaterBonus(attacker);
				end
			else
				finaldmg = finaldmg + base * pdif + souleaterBonus(attacker); --NOTE: not using 'dmg' since fTP is 1.0 for subsequent hits!!
			end
			tpHitsLanded = tpHitsLanded + 1;
		end
		tpHits = tpHits + 1;
	end	
	
	local numHits = getMultiAttacks(attacker, params.numHits);
	
	local extraHitsLanded = 0;
	
	if(numHits>1) then
		
		local hitsdone = 1;
		while (hitsdone < numHits) do 
			local chance = math.random();
			if (chance<=hitrate or math.random() < attacker:getMod(MOD_ZANSHIN)/100) then --it hit
				pdif = math.random((cratio[1]*1000),(cratio[2]*1000));  --generate random PDIF
				pdif = pdif/1000; --multiplier set.
				if(params.canCrit) then
					critchance = math.random();
					if(critchance <= critrate or hasMightyStrikes) then --crit hit!
						cpdif = math.random((ccritratio[1]*1000),(ccritratio[2]*1000)); 
						cpdif = cpdif/1000; 
						finaldmg = finaldmg + base * cpdif + souleaterBonus(attacker);
					else
						finaldmg = finaldmg + base * pdif + souleaterBonus(attacker);
					end
				else
					finaldmg = finaldmg + base * pdif + souleaterBonus(attacker); --NOTE: not using 'dmg' since fTP is 1.0 for subsequent hits!!
				end
				extraHitsLanded = extraHitsLanded + 1;
			end
			hitsdone = hitsdone + 1;
		end
	end
	-- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");
	if attacker:hasStatusEffect(EFFECT_SOULEATER) and attacker:getHP() > 10 then
		local percent = 0.1;
		if attacker:getEquipID(SLOT_HEAD) == 12516 or attacker:getEquipID(SLOT_HEAD) == 15232 or attacker:getEquipID(SLOT_BODY) == 14409 or attacker:getEquipID(SLOT_LEGS) == 15370 then
			percent = 0.12;
		end
		attacker:delHP((tpHitsLanded+extraHitsLanded)*percent*attacker:getHP());
	end
	return finaldmg, tpHitsLanded, extraHitsLanded;
end;

function souleaterBonus(attacker)
	if attacker:hasStatusEffect(EFFECT_SOULEATER) then
		local health = attacker:getHP();
		if health > 10 then
			local percent = 0.1;
			if attacker:getMainJob() ~= 8 then
				percent = percent / 2;
			end
			if attacker:getEquipID(SLOT_HEAD) == 12516 or attacker:getEquipID(SLOT_HEAD) == 15232 or attacker:getEquipID(SLOT_BODY) == 14409 or attacker:getEquipID(SLOT_LEGS) == 15370 then
				percent = percent + 0.02;
			end
			return health*percent;
		end
	else
		return 0;
	end
end;

function accVariesWithTP(hitrate,acc,tp,a1,a2,a3)
	--sadly acc varies with tp ALL apply an acc PENALTY, the acc at various %s are given as a1 a2 a3
	accpct = fTP(tp,a1,a2,a3);
	acclost = acc - (acc*accpct);
	hrate = hitrate - (0.005*acclost);
	--cap it
	if (hrate>0.95) then
		hrate = 0.95;
	end
	if (hrate<0.2) then
		hrate = 0.2;
	end
	return hrate;
end;

function getHitRate(attacker,target,capHitRate)
	local int acc = attacker:getACC();
	local int eva = target:getEVA();
	
	if(attacker:getMainLvl() > target:getMainLvl()) then --acc bonus!
		acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*4);
	elseif(attacker:getMainLvl() < target:getMainLvl()) then --acc penalty :(
		acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*4);
	end
	
	local double hitdiff = 0;
	local double hitrate = 75;
	if (acc>eva) then
	hitdiff = (acc-eva)/2;
	end
	if (eva>acc) then
	hitdiff = ((-1)*(eva-acc))/2;
	end
	
	hitrate = hitrate+hitdiff;
	hitrate = hitrate/100;
	
	
	--Applying hitrate caps
	if(capHitRate) then --this isn't capped for when acc varies with tp, as more penalties are due
		if (hitrate>0.95) then
			hitrate = 0.95;
		end
		if (hitrate<0.2) then
			hitrate = 0.2;
		end
	end
	return hitrate;
end;

function getRangedHitRate(attacker,target,capHitRate)
	local int acc = attacker:getRACC();
	local int eva = target:getEVA();
	
	if(attacker:getMainLvl() > target:getMainLvl()) then --acc bonus!
		acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*4);
	elseif(attacker:getMainLvl() < target:getMainLvl()) then --acc penalty :(
		acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*4);
	end
	
	local double hitdiff = 0;
	local double hitrate = 75;
	if (acc>eva) then
	hitdiff = (acc-eva)/2;
	end
	if (eva>acc) then
	hitdiff = ((-1)*(eva-acc))/2;
	end
	
	hitrate = hitrate+hitdiff;
	hitrate = hitrate/100;
	
	
	--Applying hitrate caps
	if(capHitRate) then --this isn't capped for when acc varies with tp, as more penalties are due
		if (hitrate>0.95) then
			hitrate = 0.95;
		end
		if (hitrate<0.2) then
			hitrate = 0.2;
		end
	end
	return hitrate;
end;

function fTP(tp,ftp1,ftp2,ftp3)
	if(tp>=100 and tp<200) then
		return ftp1 + ( ((ftp2-ftp1)/100) * (tp-100));
	elseif(tp>=200 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-200));
	else
		print("fTP error: TP value is not between 100-300!");
	end
	return 1; --no ftp mod
end;

function calculatedIgnoredDef(tp, def, ignore1, ignore2, ignore3)
	if(tp>=100 and tp <200) then
		return (ignore1 + ( ((ignore2-ignore1)/100) * (tp-100)))*def;
	elseif(tp>=200 and tp<=300) then
		return (ignore2 + ( ((ignore3-ignore2)/100) * (tp-200)))*def;
	end
	return 1; --no def ignore mod
end
--Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function cRatio(ratio,atk_lvl,def_lvl)
	--Level penalty...
	local double levelcor = 0;
	if (atk_lvl < def_lvl) then
		levelcor = 0.05 * (def_lvl - atk_lvl);
	end
	ratio = ratio - levelcor;
	
	--apply caps
	if(ratio<0) then
		ratio = 0;
	elseif(ratio>2) then
		ratio = 2;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
		cratiomin = 1.2 * ratio - 0.5;
	elseif (ratio>=1.25 and ratio<=1.5) then
		cratiomin = 1;
	elseif (ratio>1.5 and ratio<=2) then
		cratiomin = 1.2 * ratio - 0.8;
	end
	
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (ratio<0.5) then
		cratiomax = 0.4 + 1.2 * ratio;
	elseif (ratio<=0.833 and ratio>=0.5) then
		cratiomax = 1;
	elseif (ratio<=2 and ratio>0.833) then
		cratiomax = 1.2 * ratio;
	end
	cratio = {};
	if(cratiomin < 0) then 
		cratiomin = 0;
	end
	cratio[1] = cratiomin;
	cratio[2] = cratiomax;
	return cratio;
end;

--Given the raw ratio value (atk/def) and levels, returns the critical cRatio (min then max)
function cCritRatio(rratio,atk_lvl,def_lvl)
	--Level penalty...
	local double levelcor = 0;
	if (atk_lvl < def_lvl) then
		levelcor = 0.05 * (def_lvl - atk_lvl);
	end
	rratio = rratio - levelcor;
	
	--apply caps
	if(rratio<0) then
		rratio = 0;
	elseif(rratio>3) then
		rratio = 3;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (rratio<1.25) then
	cratiomin = 1.2 * rratio - 0.5;
	end
	if (rratio>=1.25 and rratio<=1.5) then
	cratiomin = 1;
	end
	if (rratio>1.5 and rratio<=3) then
	cratiomin = 1.2 * rratio - 0.8;
	end
	
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (rratio<0.5) then
	cratiomax = 0.4 + 1.2 * rratio;
	end
	if (rratio<=0.833 and rratio>=0.5) then
	cratiomax = 1;
	end
	if (rratio<=3 and rratio>0.833) then
	cratiomax = 1.2 * rratio;
	end
	
	critratio = {};
	if(cratiomin < 0) then 
		cratiomin = 0;
	end
	critratio[1] = cratiomin;
	critratio[2] = cratiomax;
	return critratio;
end;

--Given the attacker's str and the mob's vit, fSTR is calculated
function fSTR(atk_str,def_vit,base_dmg)
	local dSTR = atk_str - def_vit;
	if (dSTR >= 12) then
		fSTR2 = ((dSTR+4)/2);
	elseif (dSTR >= 6) then
		fSTR2 = ((dSTR+6)/2);
	elseif (dSTR >= 1) then
		fSTR2 = ((dSTR+7)/2);
	elseif (dSTR >= -2) then
		fSTR2 = ((dSTR+8)/2);
	elseif (dSTR >= -7) then
		fSTR2 = ((dSTR+9)/2);
	elseif (dSTR >= -15) then
		fSTR2 = ((dSTR+10)/2);
	elseif (dSTR >= -21) then
		fSTR2 = ((dSTR+12)/2);
	else
		fSTR2 = ((dSTR+13)/2);
	end
	--Apply fSTR caps.
	if (fSTR2<((base_dmg/9)*(-1))) then
		fSTR2 = (base_dmg/9)*(-1);
	elseif (fSTR2>((base_dmg/9)+8)) then
		fSTR2 = (base_dmg/9)+8;
	end 
	return fSTR2;
end;

--obtains alpha, used for working out WSC
function getAlpha(level)
alpha = 1.00; 
if (level <= 5) then
	alpha = 1.00;
elseif (level <= 11) then
	alpha = 0.99;
elseif (level <= 17) then
	alpha = 0.98;
elseif (level <= 23) then
	alpha = 0.97;
elseif (level <= 29) then
	alpha = 0.96;
elseif (level <= 35) then
	alpha = 0.95;
elseif (level <= 41) then
	alpha = 0.94;
elseif (level <= 47) then
	alpha = 0.93;
elseif (level <= 53) then
	alpha = 0.92;
elseif (level <= 59) then
	alpha = 0.91;
elseif (level <= 61) then
	alpha = 0.90;
elseif (level <= 63) then
	alpha = 0.89;
elseif (level <= 65) then
	alpha = 0.88;
elseif (level <= 67) then
	alpha = 0.87;
elseif (level <= 69) then
	alpha = 0.86;
elseif (level <= 71) then
	alpha = 0.85;
elseif (level <= 73) then
	alpha = 0.84;
elseif (level <= 75) then
	alpha = 0.83;
elseif (level <= 99) then
	alpha = 0.85;
end
return alpha;
 end; 
 
 --params contains: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300, acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atkmulti
 function doRangedWeaponskill(attacker, target, params)
	--get fstr
	local fstr = fSTR(attacker:getStat(MOD_STR),target:getStat(MOD_VIT),attacker:getRangedDmgForRank());

	--apply WSC
	local base = attacker:getRangedDmg() + fstr + 
		(attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc + 
		 attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc + 
		 attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc + 
		 attacker:getStat(MOD_CHR) * params.chr_wsc) * getAlpha(attacker:getMainLvl());
		 
	--Applying fTP multiplier
	local ftp = fTP(attacker:getTP(),params.ftp100,params.ftp200,params.ftp300);
	
		local ignoredDef = 0;
	if (params.ignoresDef == not nil and params.ignoresDef == true) then
		ignoredDef = calculatedIgnoredDef(tp, target:getStat(MOD_DEF), params.ignored100, params.ignored200, params.ignored300);
	end
	
	--get cratio min and max
	local cratio = cRatio(((attacker:getRATT() * params.atkmulti) / (target:getStat(MOD_DEF) - ignoredDef)), attacker:getMainLvl(), target:getMainLvl());
	local ccmin = 0;
	local ccmax = 0;
	local hasMightyStrikes = attacker:hasStatusEffect(EFFECT_MIGHTY_STRIKES);
	local ccritratio = 0;
	local critrate = 0;
	if(params.canCrit) then --work out critical hit ratios, by +1ing 
		ccritratio = cCritRatio( ((attacker:getRATT()*params.atkmulti)/target:getStat(MOD_DEF))+1,attacker:getMainLvl(),target:getMainLvl());
		critrate = fTP(attacker:getTP(),params.crit100,params.crit200,params.crit300);
		--add on native crit hit rate (guesstimated, it actually follows an exponential curve)
		local nativecrit = (attacker:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; --assumes +0.5% crit rate per 1 dDEX
		if(nativecrit > 0.2) then --caps!
			nativecrit = 0.2;
		elseif(nativecrit < 0.05) then
			nativecrit = 0.05;
		end
		critrate = critrate + nativecrit;
	end
	
	
	local dmg = base * ftp;  
	
	--Applying pDIF
	local double pdif = math.random((cratio[1]*1000),(cratio[2]*1000)); 
	pdif = pdif/1000; --multiplier set.
	
	--First hit has 95% acc always. Second hit + affected by hit rate.
	local double firsthit = math.random();
	local finaldmg = 0;
	local hitrate = 0.95; --first hit only
	if(params.acc100~=0) then
		--ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
		--print("Accuracy varies with TP.");
		hr = accVariesWithTP(getRangedHitRate(attacker,target,false),attacker:getRACC(),attacker:getTP(),params.acc100,params.acc200,params.acc300);
		hitrate = hr;
	end
	
	local tpHitsLanded = 0; 
	if (firsthit <= hitrate) then
		if(params.canCrit) then
			local double critchance = math.random();
			if(critchance <= critrate or hasMightyStrikes) then --crit hit!
				local double cpdif = math.random((ccritratio[1]*1000),(ccritratio[2]*1000)); 
				cpdif = cpdif/1000; 
				finaldmg = dmg * cpdif;
			else
				finaldmg = dmg * pdif;
			end
		else
			finaldmg = dmg * pdif;
		end
		tpHitsLanded = 1;
	end
	
	local numHits = params.numHits;
	
	local extraHitsLanded = 0;
	if(numHits>1) then
		if(params.acc100==0) then
			--work out acc since we actually need it now
			hitrate = getRangedHitRate(attacker,target,true);
		end
		
		hitsdone = 1;
		while (hitsdone < numHits) do 
			chance = math.random();
			if (chance<=hitrate) then --it hit
				pdif = math.random((cratio[1]*1000),(cratio[2]*1000));  --generate random PDIF
				pdif = pdif/1000; --multiplier set.
				if(canCrit) then
					critchance = math.random();
					if(critchance <= critrate or hasMightyStrikes) then --crit hit!
						cpdif = math.random((ccritratio[1]*1000),(ccritratio[2]*1000)); 
						cpdif = cpdif/1000; 
						finaldmg = finaldmg + base * cpdif;
					else
						finaldmg = finaldmg + base * pdif;
					end
				else
					finaldmg = finaldmg + base * pdif; --NOTE: not using 'dmg' since fTP is 1.0 for subsequent hits!!
				end
				extraHitsLanded = extraHitsLanded + 1;
			end
			hitsdone = hitsdone + 1;
		end
	end
	--print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!");
	
	return finaldmg, tpHitsLanded, extraHitsLanded;
end;

function getMultiAttacks(attacker, numHits)
	local bonusHits = 0;
	local tripleChances = 1;
	local doubleRate = attacker:getMod(MOD_DOUBLE_ATTACK)/100;
	local tripleRate = attacker:getMod(MOD_TRIPLE_ATTACK)/100;

	--triple only procs on first hit, or first two hits if dual wielding
	if(attacker:getOffhandDmg() > 0) then
		tripleChances = 2;
	end
	
	for i = 1, numHits, 1 do
		chance = math.random();
		if (chance < tripleRate and i <= tripleChances) then
			bonusHits = bonusHits + 2;
		else 
			--have to check if triples are possible, or else double attack chance
			-- gets accidentally increased by triple chance (since it can only proc on 1 or 2)
			if (i <= tripleChances) then
				if (chance < tripleRate + doubleRate) then
					bonusHits = bonusHits + 1;
				end
			else 
				if (chance < doubleRate) then
					bonusHits = bonusHits + 1;
				end
			end
		end
	end
	if ((numHits + bonusHits ) > 8) then
		return 8;
	end
	return numHits + bonusHits;
end;