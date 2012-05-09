     DIVINE_MAGIC_SKILL = 32;
    HEALING_MAGIC_SKILL = 33;
  ENHANCING_MAGIC_SKILL = 34;
 ENFEEBLING_MAGIC_SKILL = 35;
  ELEMENTAL_MAGIC_SKILL = 36;
       DARK_MAGIC_SKILL = 37;
          SINGING_SKILL = 40; 
         NINJUTSU_SKILL = 43;

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- V - The base damage of the spell
-- M - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually MOD_INT , except for things like Banish which is MOD_MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
SOFT_CAP = 60; --guesstimated
HARD_CAP = 120; --guesstimated

function calculateMagicDamage(V,M,player,spell,target,skilltype,atttype,hasMultipleTargetReduction)
	
	dint = player:getStat(atttype) - target:getStat(atttype);
	dmg = V;
	
	if(dint<=0) then --ifdINT penalises, it's always M=1
		dmg = dmg + dint;
	elseif(dint > 0 and dint <= SOFT_CAP) then --The standard calc, most spells hit this
		dmg = dmg + (dint*M);
	elseif(dint > 0 and dint > SOFT_CAP and dint < HARD_CAP) then --After SOFT_CAP, INT is only half effective
		dmg = dmg + SOFT_CAP*M + ((dint-SOFT_CAP)*M)/2;
	elseif(dint > 0 and dint > SOFT_CAP and dint >= HARD_CAP) then --After HARD_CAP, INT has no effect.
		dmg = dmg + HARD_CAP*M;
	end
	
	--TODO: Handle multiple target reduction (no LUA methods exist for this yet)
	
	return dmg;
	
end

-----------------------------------
--	Author: ReaperX
-- 	Returns the staff bonus for the caster and spell. 
-----------------------------------

-- NQ/HQ staves that strengthen/weaken the index element
strong_NQ = { 0x4489, 0x448f, 0x4493, 0x448d, 0x448b, 0x4491, 0x4495, 0x4497 }
strong_HQ = { 0x448A, 0x4490, 0x4494, 0x448e, 0x448c, 0x4492, 0x4496, 0x4498 }

weak_NQ = { 0x4493, 0x448d, 0x4491, 0x448b, 0x4489, 0x448f, 0x4497, 0x4495 }
weak_HQ = { 0x4494, 0x448e, 0x4492, 0x448c, 0x448A, 0x4490, 0x4498, 0x4496 }

function StaffBonus(caster,spell)
	
	staff = caster:getEquipID(1);
	ele   = 1; -- spell:getElement(); NOT IMPLEMENTED !

	if(staff == strong_NQ[ele]) then 
		staff = 1.1;
		--print("Element enhanced by staff.");
	elseif(staff == strong_HQ[ele]) then
		staff = 1.15;
		--print("Element enhanced by HQ staff.");
	elseif(staff == weak_NQ[ele]) then
		staff = 0.9;
		--print("Element weakened by staff.");
	elseif(staff == weak_HQ[ele]) then
		staff = 0.85;
		--print("Element weakened by HQ staff.");
	else
		staff = 1.0;
	end

	return staff;

end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
-- 
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(player,spell,target,diff,skill,staff)
	resist = 1.0;
	
	--raw skill + equip skill = total skill
	magicskill = player:getSkillLevel(skill) + player:getMod(79 + skill); 
	
	--else -- monster macc baseline.
	--	moblvl = player:getMainLvl();
	--	if(moblvl <= 83) then
	--		magicskill = getSkillLvl(7,moblvl);
	--	else
	--		magicskill = getSkillLvl(4,moblvl);
	--	end
	--end

	macc = 50 + player:getMod(MOD_MACC);
	
	--todo: weather
	--todo: day
	--todo: klimaform
	
	-- Elemental Seal doubles the accuracy.
	if(player:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil) then
		macc = macc * 2;
	-- Dark Seal doubles the accuracy of dark magic spells. (needs confirmation)
	elseif(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
		macc = macc * 2;
	end

	-- Baseline p.
	p = (macc / 100); -- Reasonable assumption based on 50% base magic accuracy.
	p = (p + (magicskill / 100));
	
	-- Adjust for staff bonus.
	if(staff == 0.85) then 
		p = (p - 0.3); 
		-- print("Magic accuracy weakened by HQ staff.");
	elseif(staff == 0.90) then 
		p = (p - 0.2);
		-- print("Magic accuracy weakened by staff.");
	elseif(staff == 1.10) then
		p = (p + 0.2);
		-- print("Magic accuracy enhanced by staff.");
	elseif(staff == 1.15) then
		p = (p + 0.3); 
		-- print("Magic accuracy enhanced by HQ staff.");
	end
	
	-- Adjust for dINT, or the applicable d.  Possible higher tiers.
	if(diff <= 10) then
		p = (p + (diff / 200));
	else
		p = (p + ((diff - 10) / 100));
	end

	-- Reduce for magic evasion.  Will assume a C-level skill for this.  HNMs probably have a B-level skill or above, though.
	moblvl = target:getMainLvl();
	if(moblvl <= 83) then
		meva = getSkillLvl(7,moblvl);
	else
		meva = getSkillLvl(4,moblvl);
	end
	
	meva = meva + target:getMod(MOD_MEVA);
	--todo: add on extra meva from fire resist etc (need getElement() method for spells)
	p = (p - (meva / 100));

	-- Adjust for alpha.  Kegsay: this seems to be semi-linear branching from your level.
	level = player:getMainLvl();
	moblvl = target:getMainLvl();
	alpha = 100;
	if(level >= moblvl) then
		alpha = alpha + (5 * (level - moblvl));
	else
		alpha = alpha - (10 * (moblvl - level));
	end
	
	p = (p * (alpha/100));

	-- Adjust p to be within bounds.
	if(p > 0.95) then
		p = 0.95;
	elseif(p < 0.05) then
		p = 0.05;
	end
	

	-- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
	half = (1 - p);
	quart = ((1 - p)^2);
	eighth = ((1 - p)^3);
	sixteenth = ((1 - p)^4);
	--print("HALF:",half);
	--print("QUART:",quart);
	--print("EIGHTH:",eighth);
	--print("SIXTEENTH:",sixteenth);

	resvar = math.random();
	
	-- Determine final resist based on which thresholds have been crossed.
	if(resvar <= sixteenth) then
		resist = 0.0625;
		--printf("Spell resisted to 1/16!!!  Threshold = %u",sixteenth);
	elseif(resvar <= eighth) then
		resist = 0.125;
		--printf("Spell resisted to 1/8!  Threshold = %u",eighth);
	elseif(resvar <= quart) then
		resist = 0.25;
		--printf("Spell resisted to 1/4.  Threshold = %u",quart);
	elseif(resvar <= half) then
		resist = 0.5;
		--printf("Spell resisted to 1/2.  Threshold = %u",half);
	elseif(resvar <= p) then
		resist = 1.0;
		--printf("1.0");
	end
	
	return resist;
	
end;

-----------------------------------
--	Author: Tenjou
-- 	SKILL LEVEL CALCULATOR
-- 	Returns a skill level based on level and rating.
--
--	See the translation of aushacho's work by Themanii:
--	http://home.comcast.net/~themanii/skill.html
--
--	The arguments are skill rank (numerical), and level.  1 is A+, 2 is A-, and so on.
-----------------------------------

function getSkillLvl(rank,level)
	
	skill = 0; --Failsafe
	
	if(level <= 50) then --Levels 1-50
		if(rank == 1 or rank == 2) then --A-Rated Skill
			skill = (((level-1)*3)+6);
		elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
			skill = (((level-1)*2.9)+5);
		elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
			skill = (((level-1)*2.8)+5);
		elseif(rank == 9) then --D-Rated Skill
			skill = (((level-1)*2.7)+4);
		elseif(rank == 10) then --E-Rated Skill
			skill = (((level-1)*2.5)+4);
		elseif(rank == 11) then --F-Rated Skill
			skill = (((level-1)*2.3)+4);
		end
	elseif(level > 50 and level <= 60) then --Levels 51-60
		if(rank == 1 or rank == 2) then --A-Rated Skill
			skill = (((level-50)*5)+153);
		elseif(rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
			skill = (((level-50)*4.9)+147);
		elseif(rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
			skill = (((level-50)*4.8)+142);
		elseif(rank == 9) then --D-Rated Skill
			skill = (((level-50)*4.7)+136);
		elseif(rank == 10) then --E-Rated Skill
			skill = (((level-50)*4.5)+126);
		elseif(rank == 11) then --F-Rated Skill
			skill = (((level-50)*4.3)+116);
		end
	elseif(level > 60 and level <= 70) then --Levels 61-70
		if(rank == 1) then --A+ Rated Skill
			skill = (((level-60)*4.85)+203);
		elseif(rank == 2) then --A- Rated Skill
			skill = (((level-60)*4.10)+203);
		elseif(rank == 3) then --B+ Rated Skill
			skill = (((level-60)*3.70)+196);
		elseif(rank == 4) then --B Rated Skill
			skill = (((level-60)*3.23)+196);
		elseif(rank == 5) then --B- Rated Skill
			skill = (((level-60)*2.70)+196);
		elseif(rank == 6) then --C+ Rated Skill
			skill = (((level-60)*2.50)+190);
		elseif(rank == 7) then --C Rated Skill
			skill = (((level-60)*2.25)+190);
		elseif(rank == 8) then --C- Rated Skill
			skill = (((level-60)*2.00)+190);
		elseif(rank == 9) then --D Rated Skill
			skill = (((level-60)*1.85)+183);
		elseif(rank == 10) then --E Rated Skill
			skill = (((level-60)*1.95)+171);
		elseif(rank == 11) then --F Rated Skill
			skill = (((level-60)*2.05)+159);
		end
	else --Level 71 and above
		if(rank == 1) then --A+ Rated Skill
			skill = (((level-70)*5)+251);
		elseif(rank == 2) then --A- Rated Skill
			skill = (((level-70)*5)+244);
		elseif(rank == 3) then --B+ Rated Skill
			skill = (((level-70)*3.70)+233);
		elseif(rank == 4) then --B Rated Skill
			skill = (((level-70)*3.23)+228);
		elseif(rank == 5) then --B- Rated Skill
			skill = (((level-70)*2.70)+223);
		elseif(rank == 6) then --C+ Rated Skill
			skill = (((level-70)*3)+215);
		elseif(rank == 7) then --C Rated Skill
			skill = (((level-70)*2.25)+212);
		elseif(rank == 8) then --C- Rated Skill
			skill = (((level-70)*2.00)+210);
		elseif(rank == 9) then --D Rated Skill
			skill = (((level-70)*1.85)+201);
		elseif(rank == 10) then --E Rated Skill
			skill = (((level-70)*1.95)+190);
		elseif(rank == 11) then --F Rated Skill
			skill = (((level-70)*2)+179);
		end	
	end
	
	return skill;
	
 end;
 
 function finalMagicAdjustments(caster,target,spell,dmg)
	target:delHP(dmg);
	target:updateEnmityFromDamage(caster,dmg);
	target:addTP(10);
	return dmg;
 end
 
function adjustForTarget(target,dmg)
	--e.g. family % reduction
	return dmg;
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stages 4,5,6,7,8 of Calculating Magic Damage on Wiki
function addBonuses(caster,spell,target,dmg)
	--TODO:
	--Staff Bonus
	--Day of the week / Weather bonus
	--MB bonus
	mab = (100+caster:getMod(MOD_MATT)) / (100+target:getMod(MOD_MDEF)) ;
	return dmg*mab;
end