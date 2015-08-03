
require("scripts/globals/common");
require("scripts/globals/status");

SUMMONING_MAGIC_SKILL = 38

MSG_NONE = 0; -- display nothing
MSG_NO_EFFECT = 189;
MSG_DAMAGE = 185; -- player uses, target takes 10 damage. DEFAULT
MSG_MISS = 188;
MSG_RESIST = 85;

function AvatarPhysicalMove(avatar,target,skill,numberofhits,accmod,dmgmod1,dmgmodsubsequent,tpeffect,mtp100,mtp200,mtp300)
	returninfo = {};

	--Damage = (D+fSTR) * dmgmod * PDIF
	-- printf("str: %f, vit: %f", avatar:getStat(MOD_STR), target:getStat(MOD_VIT));
	fstr = avatarFSTR(avatar:getStat(MOD_STR), target:getStat(MOD_VIT));

	lvluser = avatar:getMainLvl();
	lvltarget = target:getMainLvl();
	acc = avatar:getACC();
	eva = target:getEVA();

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

	if (base < 1) then
		base = 1;
	end
	hitdamage = base * dmgmod1;
	subsequenthitdamage = base * dmgmodsubsequent;
	if (ratio<=1) then
		maxRatio = 1;
		minRatio = 1/3;
	elseif (ratio<1.6) then
		maxRatio = ((4/6) * ratio) + (2/6);
		minRatio = ((7/9) * ratio) - (4/9);
	elseif (ratio<=1.8) then
		maxRatio = 1.8;
		minRatio = 1;
	elseif (ratio<3.6) then
		maxRatio = (2.4 * ratio) - 2.52;
		minRatio = ((5/3) * ratio) - 2;
	else
		maxRatio = 4.2;
		minRatio = 4;
	end

	if (tpeffect==TP_DMG_BONUS) then
		hitdamage = hitdamage * avatarFTP(skill:getTP(), mtp100, mtp200, mtp300);
	end
	--Applying pDIF
	local pdif = 0;

	-- start the hits
	local hitchance = math.random();
	finaldmg = 0;
	hitsdone = 1; hitslanded = 0;

	--add on native crit hit rate (guesstimated, it actually follows an exponential curve)
	nativecrit = (avatar:getStat(MOD_DEX) - target:getStat(MOD_AGI))*0.005; --assumes +0.5% crit rate per 1 dDEX
	nativecrit = nativecrit + (avatar:getMod(MOD_CRITHITRATE)/100);

	if (nativecrit > 0.2) then --caps!
		nativecrit = 0.2;
	elseif (nativecrit < 0.05) then
		nativecrit = 0.05;
	end

	local critchance = math.random();
	local hitchance = 0;
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

	-- all hits missed
	if (hitslanded == 0 or finaldmg == 0) then
		finaldmg = 0;
		hitslanded = 0;
		skill:setMsg(MSG_MISS);
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

	-- physical attack missed, skip rest
	if (skilltype == MOBSKILL_PHYSICAL and dmg == 0) then
		return 0;
	end

	-- set message to damage
	-- this is for AoE because its only set once
	skill:setMsg(MSG_DAMAGE);

	--Handle shadows depending on shadow behaviour / skilltype
	if (shadowbehav < 5 and shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --remove 'shadowbehav' shadows.
		targShadows = target:getMod(MOD_UTSUSEMI);
		shadowType = MOD_UTSUSEMI;
		if (targShadows==0) then --try blink, as utsusemi always overwrites blink this is okay
			targShadows = target:getMod(MOD_BLINK);
			shadowType = MOD_BLINK;
		end

		if (targShadows>0) then
		--Blink has a VERY high chance of blocking tp moves, so im assuming its 100% because its easier!
			if (targShadows >= shadowbehav) then --no damage, just suck the shadows
				skill:setMsg(31);
				target:setMod(shadowType,(targShadows-shadowbehav));
				if (shadowType == MOD_UTSUSEMI) then --update icon
					effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
					if (effect ~= nil) then
						if ((targShadows-shadowbehav) == 0) then
							target:delStatusEffect(EFFECT_COPY_IMAGE);
							target:delStatusEffect(EFFECT_BLINK);
						elseif ((targShadows-shadowbehav) == 1) then
							effect:setIcon(EFFECT_COPY_IMAGE);
						elseif ((targShadows-shadowbehav) == 2) then
							effect:setIcon(EFFECT_COPY_IMAGE_2);
						elseif ((targShadows-shadowbehav) == 3) then
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
	elseif (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --take em all!
		target:setMod(MOD_UTSUSEMI,0);
		target:setMod(MOD_BLINK,0);
		target:delStatusEffect(EFFECT_COPY_IMAGE);
		target:delStatusEffect(EFFECT_BLINK);
	end

	--handle Third Eye using shadowbehav as a guide
	teye = target:getStatusEffect(EFFECT_THIRD_EYE);
	if (teye ~= nil and skilltype==MOBSKILL_PHYSICAL) then --T.Eye only procs when active with PHYSICAL stuff
		if (shadowbehav == MOBPARAM_WIPE_SHADOWS) then --e.g. aoe moves
			target:delStatusEffect(EFFECT_THIRD_EYE);
		elseif (shadowbehav ~= MOBPARAM_IGNORE_SHADOWS) then --it can be absorbed by shadows
			--third eye doesnt care how many shadows, so attempt to anticipate, but reduce
			--chance of anticipate based on previous successful anticipates.
			prevAnt = teye:getPower();
			if (prevAnt == 0) then
				--100% proc
				teye:setPower(1);
				skill:setMsg(30);
				return 0;
			end
			if ( (math.random()*100) < (80-(prevAnt*10)) ) then
				--anticipated!
				teye:setPower(prevAnt+1);
				skill:setMsg(30);
				return 0;
			end
			target:delStatusEffect(EFFECT_THIRD_EYE);
		end
	end


	--TODO: Handle anything else (e.g. if you have Magic Shield and its a Magic skill, then do 0 damage.


	if (skilltype == MOBSKILL_PHYSICAL and target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD)) then
		return 0;
	end

	if (skilltype == MOBSKILL_RANGED and target:hasStatusEffect(EFFECT_ARROW_SHIELD)) then
		return 0;
	end

	-- handle elemental resistence
	if (skilltype == MOBSKILL_MAGICAL and target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
		return 0;
	end

	--handling phalanx
	dmg = dmg - target:getMod(MOD_PHALANX);
	if (dmg<0) then
		return 0;
	end

	--handle invincible
	if (target:hasStatusEffect(EFFECT_INVINCIBLE) and skilltype==MOBSKILL_PHYSICAL) then
		return 0;
	end
	--handle pd
	if ((target:hasStatusEffect(EFFECT_PERFECT_DODGE) or target:hasStatusEffect(EFFECT_ALL_MISS) )
            and skilltype==MOBSKILL_PHYSICAL) then
        return 0;
	end

	--handling stoneskin
	skin = target:getMod(MOD_STONESKIN);
	if (skin>0) then
		if (skin >= dmg) then --absorb all damage
			target:delMod(MOD_STONESKIN,dmg);
			if (target:getMod(MOD_STONESKIN)==0) then
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

-- returns true if mob attack hit
-- used to stop tp move status effects
function AvatarPhysicalHit(skill, dmg)
	-- if message is not the default. Then there was a miss, shadow taken etc
	return skill:getMsg() == MSG_DAMAGE;
end;

function avatarFTP(tp,ftp1,ftp2,ftp3)
	if (tp<100) then
		tp=100;
	end
	if (tp>=100 and tp<200) then
		return ftp1 + ( ((ftp2-ftp1)/100) * (tp-100));
	elseif (tp>=200 and tp<=300) then
		--generate a straight line between ftp2 and ftp3 and find point @ tp
		return ftp2 + ( ((ftp3-ftp2)/100) * (tp-200));
	end
	return 1; --no ftp mod
end;

--------
--  Checks if the summoner is in a Trial Size Avatar Mini Fight (used to restrict summoning while in bcnm)
--------
function avatarMiniFightCheck(caster)
   local result = 0;
   local bcnmid;
   if (caster:hasStatusEffect(EFFECT_BATTLEFIELD) == true) then
      bcnmid = caster:getStatusEffect(EFFECT_BATTLEFIELD):getPower();
      if (bcnmid == 418 or bcnmid == 609 or bcnmid == 450 or bcnmid == 482 or bcnmid == 545 or bcnmid == 578) then -- Mini Avatar Fights
         result = 40; -- Cannot use <spell> in this area.
      end
   end
   return result;
end;