
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
	
	-- Gather related stats.
	resist = 1.0;
	resist = 1;
	
	if(1 == 1) then -- if(player:isPlayer() == 1) then -- Yes I see how this might confuse you. player:isPlayer() NOT IMPLEMENTED
		magicskill = player:getSkillLevel(skill) + player:getMod(79 + skill);
	else -- "Player" is really an NPC here.
		moblvl = player:getMainLvl();
		if(moblvl <= 83) then
			magicskill = getSkillLvl(7,moblvl);
		else
			magicskill = getSkillLvl(4,moblvl);
		end
	end

	macc = 50 + player:getMod(MOD_MACC);
--[[ WEATHER NOT IMPLEMENTED
	zone = Zone(player:getZone());
	weather = zone:getWeather();
	element = spell:getElement();

-- Klimaform

	if(player:getStatusEffect(EFFECT_KLIMAFORM) ~= nil) then
		if((weather == Gloom or weather == Darkness or player:getStatusEffect(EFFECT_VOIDSTORM) ~= nil) and (element == 8)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Dark Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == Auroras or weather == StellarGlare or player:getStatusEffect(EFFECT_AURORASTORM) ~= nil) and (element == 7)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Light Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == Thunder or weather == Thunderstorms or player:getStatusEffect(EFFECT_THUNDERSTORM) ~= nil ) and (element == 6)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Lightning Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == Snow or weather == Blizzard or player:getStatusEffect(EFFECT_HAILSTORM) ~= nil) and (element == 5)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Ice Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == Wind or weather == Gales or player:getStatusEffect(EFFECT_WINDSTORM) ~= nil) and (element == 4)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Wind Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == Rain or weather == Squall or player:getStatusEffect(EFFECT_RAINSTORM) ~= nil) and (element == 3)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Water Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == DustStorm or weather == SandStorm or player:getStatusEffect(EFFECT_SANDSTORM) ~= nil) and (element == 2)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Earth Spell Magic Accuracy Enhanced by Klimaform");
		elseif((weather == HotSpell or weather == HeatWave or player:getStatusEffect(EFFECT_FIRESTORM) ~= nil) and (element == 1)) then
			macc = macc + KLIMAFORM_MACC;
			--print("Fire Spell Magic Accuracy Enhanced by Klimaform");
		end
	end
]]
	-- Elemental Seal doubles the accuracy.
	if(player:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil) then
		macc = macc * 2;
	-- Dark Seal doubles the accuracy of dark magic spells. (needs confirmation)
	elseif(player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
		macc = macc * 2;
	end

	-- Baseline p.
	p = (macc / 100); -- Reasonable assumption based on 50% base magic accuracy.
--[[ WEAVER NOT IMPLEMENTED
	-- Diabolos's Earring increases M.Acc. in dark weather.
	if(weather == Gloom or weather == Darkness) then
		ear1 = player:getEquipID(12);
		ear2 = player:getEquipID(13);
		if(ear1 == DiabolosEarring or ear2 == DiabolosEarring) then
			p = (p+0.02);
			--print("Magic accuracy enhanced by Diabolos's Earring.");
		end
	end
]]
--[[
	-- Adjust for magic skill.
	vanaday = getVanaDayElement();
	ring1 = player:getEquipID(14);
	ring2 = player:getEquipID(15);
	-- Diabolos's Ring increases Dark Magic skill on Darksday.
	if(ring1 == 0x3CC5 or ring2 == 0x3CC5) then
		if(vanaday == Darksday and skill == DARK_MAGIC_SKILL) then
			magicskill = (magicskill + 15);
			--print("Dark Magic skill increased by Diabolos's Ring.");
		end
	end
]]	
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
	p = (p - (meva / 100));

	-- Reduce for elemental resist.  From kegsay: this is actually additional magic evasion.
	elementalres = 0;
	element = 1; --spell:getElement(); NOT IMPLEMENTED !
	
	switch (element): caseof {
		[1] = function (x) elementalres = target:getMod(MOD_FIRERES); end, --Fire
		[2] = function (x) elementalres = target:getMod(MOD_EARTHRES); end, --Earth
		[3] = function (x) elementalres = target:getMod(MOD_WATERRES); end, --Water
		[4] = function (x) elementalres = target:getMod(MOD_WINDRES); end, --Wind
		[5] = function (x) elementalres = target:getMod(MOD_ICERES); end, --Ice
		[6] = function (x) elementalres = target:getMod(MOD_THUNDERRES); end, --Thunder
		[7] = function (x) elementalres = target:getMod(MOD_LIGHTRES); end, --Light
		[8] = function (x) elementalres = target:getMod(MOD_DARKRES); end, --Dark
	default = function (x) end, }
	
	p = p + (1 - (elementalres / 100));

	-- Adjust for alpha.  Kegsay: this seems to be semi-linear branching from your level.
	level = player:getMainLvl();
	moblvl = target:getMainLvl();
	alpha = 1.0;
	if(level >= moblvl) then
		alpha = alpha + (5 * (level - moblvl));
	else
		alpha = alpha - (10 * (moblvl - level));
	end
	
	p = (p * alpha);

	-- Adjust p to be within bounds.
	if(p > 0.95) then
		p = 0.95;
	elseif(p < 0.05) then
		p = 0.05;
	end
	-- print("P: " .. p);

	-- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
	half = (1 - p);
	quart = ((1 - p)^2);
	eighth = ((1 - p)^3);
	sixteenth = ((1 - p)^4); -- Reasonable assumption based on the above pattern.
	--print("HALF:",half);
	--print("QUART:",quart);
	--print("EIGHTH:",eighth);
	--print("SIXTEENTH:",sixteenth);

	-- Pseudo-randomized seed to calculate resist chance for this spell.
--	if(spell:getCurrTargNum() == 1) then
--		math.randomseed(os.time());
--	end

	resvar = math.random();resvar = math.random();resvar = math.random();
	--print("RES:",resvar);

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
 
-----------------------------------
--	Author: ReaperX
-- 	Elemental Debuff Potency functions
-----------------------------------

function getElementalDebuffDOT(sINT)
	
	if(sINT<= 39) then
		DOT = 1;
	elseif(sINT <= 69) then
		DOT = 2;
	elseif(sINT <= 99) then
		DOT = 3;
	elseif(sINT <= 149) then
		DOT = 4;
	else 
		DOT = 5;
	end;
	
	return DOT;
	
end;

function getElementalDebuffStatDownFromDOT(dot)
	
	if(dot == 1) then
		stat_down = 5;
	elseif(dot == 2) then
		stat_down = 7;
	elseif(dot == 3) then
		stat_down = 9;
	elseif(dot == 4) then
		stat_down = 11;
	else
		stat_down = 13;
	end;
	
	return stat_down;
	
end; 

-----------------------------------
--	Author: Tenjou
-- 	MAGICAL DAMAGE
-- 	Consolidating this section into one script so that any one change will affect all spells.
-----------------------------------

function takeMagicalDamage(caster,target,final)

	if(caster:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil and caster:getEquipID(1) == 18994) then --Laevateinn enhances spell damage 10% with Elemental Seal.
		final = final * 1.1;
	end
	
	target:delHP(final);
	target:updateEnmity(caster,final*(240/math.floor((6+(target:getMainLvl()*31/50)))),final*(80/math.floor((6+(target:getMainLvl()*31/50)))));
	
	return final;
	
end

-----------------------------------
--	Author: Tenjou
-- 	NATURAL/ELEMENTAL RESISTANCE
-- 	Final adjustment to spell damage.
-----------------------------------

function getNaturalResist(family)

	natural = 1.0;

	switch (family): caseof {
	[4] = function (x) natural = 0.75; end, --Ahriman
	[52] = function (x) natural = 0.75; end, --Cardian
	[61] = function (x) natural = 0.75; end, --Corse
	[89] = function (x) natural = 0.875; end, --Evil Weapon
	[90] = function (x) natural = 1.25; end, --Flan
	[98] = function (x) natural = 0.875; end, --Ghrah
	[122] = function (x) natural = 0.75; end, --Kindred
	[124] = function (x) natural = 0.875; end, --Lamia
	[127] = function (x) natural = 0.5; end, --Magic Pot
	default = function (x) end, }

	return natural;
	
end;

-----------------------------------
--	Author: Tenjou
-- 	Cure Potency Check
-- 	List of gear which enhances Cure Potency.
-----------------------------------

function curePotency(caster)
	c = 0;
	main = caster:getEquipID(1);
	sub = caster:getEquipID(2);
	range = caster:getEquipID(3);
	ammo = caster:getEquipID(4);
	head = caster:getEquipID(5);
	body = caster:getEquipID(6);
	hand = caster:getEquipID(7);
	leg = caster:getEquipID(8);
	foot = caster:getEquipID(9);
	neck = caster:getEquipID(10);
	waist = caster:getEquipID(11);
	ear1 = caster:getEquipID(12);
	ear2 = caster:getEquipID(13);
	ring1 = caster:getEquipID(14);
	ring2 = caster:getEquipID(15);
	back = caster:getEquipID(16);

	if(main == 0x443a or sub == 0x443a) then
		c = (c+0.01);
		--print("Cure enhanced by Dia Wand.");
	end
	if(main == 0x442e or sub == 0x442e) then
		c = (c+0.05);
		--print("Cure enhanced by Asklepios.");
	end
	if(main == 0x4999 or sub == 0x4999) then
		c = (c+0.10);
		--print("Cure enhanced by Templar Mace.");
	end
	if(main == 17557 or main == 17558 or main == 0x42d4 or main == 0x429b) then
		c = (c+0.10);
		--print("Cure enhanced by Staff.");
	end
	if(body == 0x313d) then
		c = (c+0.10);
		--print("Cure enhanced by Noble's Tunic.");
	elseif(body == 0x35ce) then
		c = (c+0.12);
		--print("Cure enhanced by Aristocrat's Coat.");
	end
	if(ear1 == 0x39d7 or ear2 == 0x39d7) then
		c = (c+0.05);
		--print("Cure enhanced by Hospitaler Earring.");
	end
	if(ear1 == 0x3e82 or ear2 == 0x3e82) then
		c = (c+0.05);
		--print("Cure enhanced by Roundel Earring.");
	end
	if(ring1 == 0x33e8 or ring2 == 0x33e8) then
		hp = caster:getHP();
		maxhp = caster:getMaxHP();
		ratio = (hp/maxhp);
		tp = caster:getTP();
		if(ratio <= 0.75 and tp <= 100) then
			c = (c+0.10);
			--print("Cure enhanced by Medicine Ring.");
		end
	end
	--print("Total enhancement: " .. (c+1));
	
	return c;
	
 end;
 
 -----------------------------------
--	Author: Tenjou
-- 	HEAL
-- 	Consolidating this section into one script so that any one change will affect all cure spells.
-----------------------------------

function heal(caster,target,final)

	--Divine Seal doubles the amount.
	if(caster:getStatusEffect(EFFECT_DIVINE_SEAL) ~= nil) then
		final = final*2;
	end
	
	target:addHP(final);
	
	return final;
	
end

-----------------------------------
--	Author: Tenjou
-- 	CURE RESISTANCE
-- 	To harm undead.
-----------------------------------

function cureResist(family)

	resist = 0.0;
	undead = {61,69,93,97,223,151,164,167,73,186};
	
	--print("FAMILY:",family);
	for i = 0,table.getn(undead) do
		if(family == undead[i]) then
			resist = -1;
		end
	end

	return resist;

 end;

-- USED FOR DAMAGING MAGICAL SPELLS. Stages 4,5,6,7,8 of Calculating Magic Damage on Wiki
function applyBonuses(dmg,player,spell,target)
	--TODO:
	--Staff Bonus
	--Day of the week / Weather bonus
	--MB bonus
	--MAB/MDB
	--Target adjustment %
	return dmg;
end