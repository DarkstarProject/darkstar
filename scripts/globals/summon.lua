
require("scripts/globals/common");
require("scripts/globals/status");

SUMMONING_MAGIC_SKILL = 38

function avatarPerpetuation(caster, spell)

	cost = 0;
	id = spell:getID();
	level = caster:getMainJob() == 15 and caster:getMainLvl() or caster:getSubLvl();
	if id >= 288 and id <= 295 then
		if level < 19 then
			cost = 1;
		elseif level < 38 then
			cost = 2;
		elseif level < 57 then
			cost = 3;
		elseif level < 75 then
			cost = 4;
		elseif level < 81 then
			cost = 5;
		elseif level < 91 then
			cost = 6;
		else
			cost = 7;
		end
	elseif id == 296 then
		if level < 10 then
			cost = 1;
		elseif level < 18 then
			cost = 2;
		elseif level < 27 then
			cost = 3;
		elseif level < 36 then
			cost = 4;
		elseif level < 45 then
			cost = 5;
		elseif level < 54 then
			cost = 6
		elseif level < 63 then
			cost = 7;
		elseif level < 72 then
			cost = 8;
		elseif level < 81 then
			cost = 9;
		elseif level < 91 then
			cost = 10;
		else
			cost = 11;
		end
	elseif id == 297 then
		if level < 8 then
			cost = 1;
		elseif level < 15 then
			cost = 2;
		elseif level < 22 then
			cost = 3;
		elseif level < 30 then
			cost = 4;
		elseif level < 37 then
			cost = 5;
		elseif level < 45 then
			cost = 6
		elseif level < 51 then
			cost = 7;
		elseif level < 59 then
			cost = 8;
		elseif level < 66 then
			cost = 9;
		elseif level < 73 then
			cost = 10;
		elseif level < 81 then
			cost = 11;
		elseif level < 91 then
			cost = 12;
		else
			cost = 13;
		end
	elseif id <= 304 then
		if level < 10 then
			cost = 3;
		elseif level < 19 then
			cost = 4;
		elseif level < 28 then
			cost = 5;
		elseif level < 38 then
			cost = 6;
		elseif level < 47 then
			cost = 7;
		elseif level < 56 then
			cost = 8
		elseif level < 65 then
			cost = 9;
		elseif level < 68 then
			cost = 10;
		elseif level < 71 then
			cost = 11;
		elseif level < 74 then
			cost = 12;
		elseif level < 81 then
			cost = 13;
		elseif level < 91 then
			cost = 14;
		else
			cost = 15;
		end
	end
	
	return cost;
end;

function AvatarPhysicalMove(avatar,target,skill,numberofhits,accmod,dmgmod1,dmgmodsubsequent,tpeffect,mtp100,mtp200,mtp300)
	returninfo = {};
	
	--Damage = (D+fSTR) * dmgmod * PDIF
	fstr = avatarFSTR(avatar:getStat(MOD_STR), target:getStat(MOD_VIT));
	
	lvluser = avatar:getMainLvl();
	lvltarget = target:getMainLvl();
	acc = avatar:getMod(MOD_ACC);
	eva = target:getMod(MOD_EVA);
	
	local base = avatar:getWeaponDmg() + fstr;
	local ratio = avatar:getStat(MOD_ATT)/target:getStat(MOD_DEF);
	
	lvldiff = lvluser - lvltarget;

	--work out hit rate for mobs (bias towards them)
	hitrate = (acc*accmod) - eva;
	if (lvluser > lvltarget) then 
		hitrate = hitrate + ((lvluser-lvltarget)*5);
	end
	if (lvltarget > lvluser) then 
		hitrate = hitrate + ((lvltarget-lvluser)*3);
	end
	if (hitrate > 95) then
		hitrate = 95;
	end
	if (hitrate < 20) then
		hitrate = 20;
	end
	
	if(base < 1) then
		base = 1;
	end
	hitdamage = base * dmgmod1;
	subsequenthitdamage = base * dmgmodsubsequent;
	if(ratio<=1) then
		maxRatio = 1;
		minRatio = 1/3;
	elseif(ratio<1.6) then
		maxRatio = ((4/6) * ratio) + (2/6);
		minRatio = ((7/9) * ratio) - (4/9);
	elseif(ratio<=1.8) then
		maxRatio = 1.8;
		minRatio = 1;
	elseif(ratio<3.6) then
		maxRatio = (2.4 * ratio) - 2.52;
		minRatio = ((5/3) * ratio) - 2;
	else
		maxRatio = 4.2;
		minRatio = 4;
	end
	
	if(tpeffect==TP_DMG_BONUS) then
		hitdamage = hitdamage * avatarFTP(skill:getTP(), mtp100, mtp200, mtp300);
	end
	--Applying pDIF
	local double pdif = 0; 

	-- start the hits
	local double hitchance = math.random();
	finaldmg = 0;
	hitsdone = 1; hitslanded = 0;
	
	--add on native crit hit rate (guesstimated, it actually follows an exponential curve)
	nativecrit = (avatar:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; --assumes +0.5% crit rate per 1 dDEX
	nativecrit = nativecrit + (avatar:getMod(MOD_CRITHITRATE)/100);
	
	if(nativecrit > 0.2) then --caps!
		nativecrit = 0.2;
	elseif(nativecrit < 0.05) then
		nativecrit = 0.05;
	end
	
	local double critchance = math.random();
	local double hitchance = 0;
	local crit = false;
	if critchance <= nativecrit then
		crit = true;
	else
		hitchance = math.random();
	end
	
	if crit == true or hitchance*100 <= 95 then
		pdif = math.random((minRatio * 1000), (maxRatio * 1000));
		pdif = pdif/1000;
		if crit == true then
			pdif = pdif + 1;
			if pdif > 4.2 then
				pdif = 4.2
			end
		end
		finaldmg = finaldmg + hitdamage * pdif;
		hitslanded = hitslanded + 1;
	end
	while (hitsdone < numberofhits) do
		chance = math.random();
		if ((chance*100)<=hitrate) then
			pdif = math.random((minRatio * 1000), (maxRatio * 1000));
			pdif = pdif/1000;
			finaldmg = finaldmg + subsequenthitdamage * pdif;
			hitslanded = hitslanded + 1;
		end
		hitsdone = hitsdone + 1;
	end
	
	returninfo.dmg = finaldmg;
	returninfo.hitslanded = hitslanded;
	
	return returninfo;
end;

--Given the attacker's str and the mob's vit, fSTR is calculated
function avatarFSTR(atk_str,def_vit)
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
	if (fSTR2< -1) then
		fSTR2 = -1;
	elseif (fSTR2>8) then
		fSTR2 = 8;
	end 
	return fSTR2;
end;

function AvatarFinalAdjustments(dmg,mob,skill,target,skilltype,skillparam,shadowbehav)
	--Handle shadows depending on shadow behaviour / skilltype
	if(shadowbehav < 5 and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows. 
		targShadows = target:getMod(MOD_UTSUSEMI);
		shadowType = MOD_UTSUSEMI;
		if(targShadows==0)then --try blink, as utsusemi always overwrites blink this is okay
			targShadows = target:getMod(MOD_BLINK);
			shadowType = MOD_BLINK;
		end
		
		if(targShadows>0)then
		--Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!
			if(targShadows >= shadowbehav) then --no damage, just suck the shadows
				skill:setMsg(31);
				target:setMod(shadowType,(targShadows-shadowbehav));
				if(shadowType == MOD_UTSUSEMI) then --update icon
					effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
					if(effect ~= nil) then
						if((targShadows-shadowbehav) == 0) then
							target:delStatusEffect(EFFECT_COPY_IMAGE);
							target:delStatusEffect(EFFECT_BLINK);
						elseif((targShadows-shadowbehav) == 1) then
							effect:setIcon(EFFECT_COPY_IMAGE);
						elseif((targShadows-shadowbehav) == 2) then
							effect:setIcon(EFFECT_COPY_IMAGE_2);
						elseif((targShadows-shadowbehav) == 3) then
							effect:setIcon(EFFECT_COPY_IMAGE_3);
						end
					end
				end
				return shadowbehav;
			else --less shadows than this move will take, remove all and factor damage down
				dmg = dmg * ((shadowbehav-targShadows)/shadowbehav);
				target:setMod(MOD_UTSUSEMI,0);
				target:setMod(MOD_BLINK,0);
				target:delStatusEffect(EFFECT_COPY_IMAGE);
				target:delStatusEffect(EFFECT_BLINK);
			end
		end
	elseif(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
		target:setMod(MOD_UTSUSEMI,0);
		target:setMod(MOD_BLINK,0);
		target:delStatusEffect(EFFECT_COPY_IMAGE);
		target:delStatusEffect(EFFECT_BLINK);
	end
	
	--handle Third Eye using shadowbehav as a guide
	teye = target:getStatusEffect(EFFECT_THIRD_EYE);
	if(teye ~= nil and skilltype==MOBSKILL_PHYSICAL) then --T.Eye only procs when active with PHYSICAL stuff
		if(shadowbehav == MOBPARAM_WIPE_SHADOWS) then --e.g. aoe moves
			target:delStatusEffect(EFFECT_THIRD_EYE);
		elseif(shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --it can be absorbed by shadows
			--third eye doesnt care how many shadows, so attempt to anticipate, but reduce
			--chance of anticipate based on previous successful anticipates.
			prevAnt = teye:getPower();
			if(prevAnt == 0) then
				--100% proc
				teye:setPower(1);
				skill:setMsg(30);
				return 0;
			end
			if( (math.random()*100) < (80-(prevAnt*10)) ) then
				--anticipated!
				teye:setPower(prevAnt+1);
				skill:setMsg(30);
				return 0;
			end
			target:delStatusEffect(EFFECT_THIRD_EYE);
		end
	end
	
	
	--TODO: Handle anything else (e.g. if you have Magic Shield and its a Magic skill, then do 0 damage.
	
	--handling phalanx
	dmg = dmg - target:getMod(MOD_PHALANX);
	if(dmg<0) then
		return 0;
	end
	
	--handle invincible
	if(target:hasStatusEffect(EFFECT_INVINCIBLE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end
	--handle pd
	if(target:hasStatusEffect(EFFECT_PERFECT_DODGE) and skilltype==MOBSKILL_PHYSICAL)then
		return 0;
	end
	
	--handling stoneskin
	skin = target:getMod(MOD_STONESKIN);
	if(skin>0) then
		if(skin >= dmg) then --absorb all damage
			target:delMod(MOD_STONESKIN,dmg);
			if(target:getMod(MOD_STONESKIN)==0) then
				target:delStatusEffect(EFFECT_STONESKIN);
			end
			return 0;
		else --absorbs some damage then wear
			target:delMod(MOD_STONESKIN,skin);
			target:delStatusEffect(EFFECT_STONESKIN);
			return dmg - skin;
		end
	end
	
	return dmg;
end;

function avatarFTP(tp,ftp1,ftp2,ftp3)
	if(tp<100) then
		tp=100;
	end
	if(tp>=100 and tp<200) then
		return ftp1 + ( ((ftp2-ftp1)/100) * (tp-100));
	elseif(tp>=200 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-200));
	end
	return 1; --no ftp mod
end;