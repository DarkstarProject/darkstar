-----------------------------------
--  Trust: Kupipi
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

-----------------------------------------------------------------------------------
--  Spawn/Despawn Functions
-----------------------------------------------------------------------------------
function onTrustSpawn(trust)

	-- WINDURST STARTER TRUST QUEST
	------------------------------------------------
    local master = trust:getMaster();
	if(master:getVar("WindurstFirstTrust") == 1) then
		master:setVar("WindurstFirstTrust", 2);
	end
	------------------------------------------------
	
	master:setVar("KupipiStarterSpell", 1);
	
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.KUPIPI);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.KUPIPI);
	
	trust:setDamage(trust:getMainLvl() * 2);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.CLUB));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WHM, dsp.skill.SHIELD));
	
	if master:hasTrust(dsp.trust.SHANTOTTO) then
		SendPartyMessage(trust, "Doctor Shantotto is here? For better or worse, this'll be a day to remember-wember!");
	elseif master:hasTrust(dsp.trust.STAR_SIBYL) then
		SendPartyMessage(trust, "I-it's the Sta~r Sibyl! Please, bring peace to Windurst!");
	else
		SendPartyMessage(trust, "You can entrust e~verything to the meticulous Kupipi!");
	end
end

function onTrustDeath(trust, player)
	SendPartyMessage(trust, "These tears...they sting-wing...");
end

function onTrustDespawn(trust)
	SendPartyMessage(trust, "What a wo~nderful time I had!");
end


-----------------------------------------------------------------------------------
--  Battle Functions
-----------------------------------------------------------------------------------
function onTrustEngaged(trust,target)
    local master = trust:getMaster()
	local buffSpells = trust:getTrustBuffSpells()
	
	if(master:getVar("KupipiStarterSpell") == 1) then
		for i, spell in ipairs(buffSpells) do
			local spellId = spell:getSpellID()
			if(spellId >= 125 and spellId <= 129)then --Protect AOE
				if(trust:getMP() >= trust:getSpellCost(spellId)) then
					trust:castSpell(spellId, trust)
					break
				end
			end
		end
		for i, spell in ipairs(buffSpells) do
			local spellId = spell:getSpellID()
			if(spellId >= 130 and spellId <= 134)then --Shell AOE
				if(trust:getMP() >= trust:getSpellCost(spellId)) then
					trust:castSpell(spellId, trust)
					break
				end
			end
		end
		master:setVar("KupipiStarterSpell", 0);
	end

	return 0
end

function onTrustFight(trust,target)
	return 0
end

function onTrustCast(trust)
    local PMaster = trust:getMaster()
	local PParty = PMaster:getParty()
	local PTrusts = PMaster:getPartyTrusts()
	local healSpells = trust:getTrustHealSpells()
	local buffSpells = trust:getTrustBuffSpells()
	local spellId = 0
	
	--Check Buff
	spellId, target = checkBuff(buffSpells, trust, PMaster, PParty, PTrusts)
	if(spellId > 0) then
		return spellId, target:getShortID()		
	end
	
	--Check Sleep
	spellId, target = checkSleep(healSpells, trust, PMaster, PParty, PTrusts)
	if(spellId > 0) then
		return spellId, target:getShortID()		
	end
	
	--Check Cure
	spellId, target = checkCure(healSpells, trust, PMaster, PParty, PTrusts)
	if(spellId > 0) then
		return spellId, target:getShortID()		
	end
	
	return 0,0
end

function onTrustDisengage(trust,target)
	return 0
end


-----------------------------------------------------------------------------------
--  Action Check Functions
-----------------------------------------------------------------------------------
function onTrustSpellCheck(target, trust, spell)
    local dMND = trust:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)
	local lvlDiff = trust:getMainLvl() - target:getMainLvl()
	
	if(lvlDiff >= -6 and lvlDiff <= 6) then
		if(spell:getID() == 56) then --Slow
			if(spellResistCheck(trust, target, spell, dsp.effect.SLOW, dsp.skill.ENFEEBLING_MAGIC, dMND, 0) < 0.5) then
				return 1
			end
		end
		
		if(spell:getID() == 58) then --Paralyze
			if(spellResistCheck(trust, target, spell, dsp.effect.PARALYSIS, dsp.skill.ENFEEBLING_MAGIC, dMND, 0) < 0.5) then
				return 1
			end
		end
	end

	return 0
end

function onTrustSkillCheck(target, trust, skill)
	return 0
end

function onTrustWeaponSkillCheck(target, trust, wskill)
	return 0
end

function checkSleep(healSpells, trust, master, party, trusts)
	if (not trust:hasStatusEffect(dsp.effect.SLEEP_I) and not trust:hasStatusEffect(dsp.effect.SLEEP_II)) then
		for i, spell in ipairs(healSpells) do
			local spellId = spell:getSpellID()
			if(spellId == 1 and trust:getMP() >= trust:getSpellCost(spellId)) then
			
				if (master:hasStatusEffect(dsp.effect.SLEEP_I) or master:hasStatusEffect(dsp.effect.SLEEP_II)) then
					return spellId, master
				end
				for i, PMember in pairs(party) do
					if(not PMember == master) then
						if (PMember:hasStatusEffect(dsp.effect.SLEEP_I) or PMember:hasStatusEffect(dsp.effect.SLEEP_II)) then
							return spellId, PMember
						end
					end
				end
				for i, PTrust in pairs(trusts) do
					if (PTrust:hasStatusEffect(dsp.effect.SLEEP_I) or PTrust:hasStatusEffect(dsp.effect.SLEEP_II)) then
						return spellId, PTrust
					end
				end
				break
			end
		end
	end

	return 0, 0
end

function checkBuff(buffSpells, trust, master, party, trusts)
	for i, spell in ipairs(buffSpells) do
		local spellId = spell:getSpellID()
		
		if(spellId >= 125 and spellId <= 129)then --Protect AOE
			if (not trust:hasStatusEffect(dsp.effect.PROTECT)) then
				if(trust:getMP() >= trust:getSpellCost(spellId)) then
					return spellId, trust
				end
			end
		end
		if(spellId >= 130 and spellId <= 134)then --Shell AOE
			if(not trust:hasStatusEffect(dsp.effect.SHELL)) then
				if(trust:getMP() >= trust:getSpellCost(spellId)) then
					trust:castSpell(spellId, trust)
					break
				end
			end
		end
		
		if(spellId >= 43 and spellId <= 47)then --Protect Single
			if(trust:getMP() >= trust:getSpellCost(spellId)) then
				if (not master:hasStatusEffect(dsp.effect.PROTECT)) then
					return spellId, master
				end
				for i, PMember in pairs(party) do
					if(not PMember == master) then
						if (not PMember:hasStatusEffect(dsp.effect.PROTECT)) then
							return spellId, PMember
						end
					end
				end
				for i, PTrust in pairs(trusts) do
					if (not PTrust:hasStatusEffect(dsp.effect.PROTECT)) then
						return spellId, PTrust
					end
				end
			end
		end
		if(spellId >= 48 and spellId <= 52)then --Shell Single
			if(trust:getMP() >= trust:getSpellCost(spellId)) then
				if (not master:hasStatusEffect(dsp.effect.SHELL)) then
					return spellId, master
				end
				for i, PMember in pairs(party) do
					if(not PMember == master) then
						if (not PMember:hasStatusEffect(dsp.effect.SHELL)) then
							return spellId, PMember
						end
					end
				end
				for i, PTrust in pairs(trusts) do
					if (not PTrust:hasStatusEffect(dsp.effect.SHELL)) then
						return spellId, PTrust
					end
				end
			end
		end
	end
	
	return 0,0
end

function checkCure(healSpells, trust, master, party, trusts)
	local healPercent = trust:getMobMod(dsp.mobMod.HP_HEAL_CHANCE)	
	for i, spell in ipairs(healSpells) do
		local spellId = spell:getSpellID()
		if(trust:getMP() >= trust:getSpellCost(spellId)) then
			if(master:getHPP() <= healPercent) then
				return spellId, master
			end
			
			if(trust:getHPP() <= healPercent) then
				return spellId, trust
			end
			
			for i, PMember in pairs(party) do
				if(PMember:getHPP() <= healPercent) then
					return spellId, PMember
				end
			end

			for i, Ptrust in pairs(trusts) do
				if(Ptrust:getHPP() <= healPercent) then
					return spellId, Ptrust
				end
			end
		end
	end
	return 0, 0
end

function spellResistCheck(caster, target, spell, effect, skillType, diff, bonus)
    local params = {}
    params.diff = diff
    params.skillType = skillType
    params.bonus = bonus
    params.effect = effect
    return applyResistanceEffect(caster, target, spell, params)
end