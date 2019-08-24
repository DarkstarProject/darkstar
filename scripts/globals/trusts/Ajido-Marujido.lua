-----------------------------------
--  Trust: Ajido-Marujido
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
    local master = trust:getMaster()
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.AJIDO_MARUJIDO)
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.AJIDO_MARUJIDO)
	trust:addMobMod(dsp.mobMod.VAR, 15) --used for change to cast elemental spell
	
	trust:setDamage(trust:getMainLvl());
	trust:setMod(dsp.mod.STR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.DEX,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.VIT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.AGI,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.INT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.MND,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.CHR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.ATT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF)/2)
	trust:setMod(dsp.mod.ACC,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.EVA,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.DEF,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.BLM, dsp.skill.STAFF))
	
	if master:hasTrust(dsp.trust.SHANTOTTO) then
	    SendPartyMessage(trust, "D-Doctor Shantotto! I expectaru you know who's on whose side?")
	elseif master:hasTrust(dsp.trust.STAR_SIBYL) then
	    SendPartyMessage(trust, "Oh, Star Sibyl! None are more devoted to you than Karaha-Baruha and myself.")
	elseif master:hasTrust(dsp.trust.KORU_MORU) then
	    SendPartyMessage(trust, "What a coincidence to find... you here, Koru-Moru. I'd prefer-wer that we go our seperate ways...")
	elseif master:hasTrust(dsp.trust.SEMIH_LAFIHNA) then
	    SendPartyMessage(trust, "Semih Lafihna, I trust-wust you can handle things here if something happens to me.")
	else
		SendPartyMessage(trust, "Come! Together we will discover the truthy-wuth!")
	end
end

function onTrustDeath(trust)
    SendPartyMessage(trust, "I've...failed.")
end

function onTrustDespawn(trust)
	SendPartyMessage(trust, "Genius-wenius is never understood in its own time.")
end


-----------------------------------------------------------------------------------
--  Battle Functions
-----------------------------------------------------------------------------------
function onTrustEngaged(trust,target)
	if(getLevelDif(trust, target) <= 5) then
		trust:setMobMod(dsp.mobMod.VAR, 20)
	else
		trust:setMobMod(dsp.mobMod.VAR, 10)	
	end
	return 0
end

function onTrustFight(trust,target)
    local master = trust:getMaster()
	if(trust:hasTopEnmity(target) and trust:canCastSpells() == true) then
		trust:stopCasting()
	else
		trust:startCasting()
	end
end

function onTrustCast(trust)
    local master = trust:getMaster()
	local target = trust:getTarget()
	local healSpells = trust:getTrustHealSpells()
	local debuffSpells = trust:getTrustDebuffSpells()
	local damageSpells = trust:getTrustDamageSpells()
	local spellId = 0;
	
	if(target:canDispelStatusEffect() > 0) then
		spellId = checkDispelSpell(debuffSpells)
	
	elseif(math.random(100) <= trust:getMobMod(dsp.mobMod.VAR)) then
		--Check for Debuffs to Apply
		spellId = checkDebuff(debuffSpells, trust, target)

		--Check for damage Spell to use
		spellId = checkDamageSpell(damageSpells, trust, target)
		
		if(spellId > 0) then
			trust:setMobMod(dsp.mobMod.VAR, 50)
			if(math.random(100) <= 70) then
				if(getLevelDif(trust, target) <= 5) then
					trust:setMobMod(dsp.mobMod.VAR, 20)
				else
					trust:setMobMod(dsp.mobMod.VAR, 10)
				end
			end
		end
	else
		spellId, target = checkCure(healSpells, trust, master)
	end
	
	

	return spellId, target:getShortID()
end

function onTrustDisengage(trust,target)
	return 0
end


-----------------------------------------------------------------------------------
--  Action Check Functions
-----------------------------------------------------------------------------------
function onTrustSpellCheck(target, trust, spell)
	return 0
end

function onTrustSkillCheck(target, trust, skill)
	return 0
end;

function onTrustWeaponSkillCheck(target, trust, wskill)
	return 0
end


-----------------------------------------------------------------------------------
--  Other Functions
-----------------------------------------------------------------------------------
function checkDebuff(debuffSpells, trust, target)
	for i, spell in ipairs(debuffSpells) do
		local spellId = spell:getSpellID()
		if(trust:getMP() >= trust:getSpellCost(spellId)) then
			if(spellId == 56) then --Slow
				if(not trust:hasRecast(dsp.recast.RECAST_MAGIC, spellId, 0)) then
					if(not target:hasStatusEffect(dsp.effect.SLOW)) then
						return spellId
					end
				end
			end
			if(spellId == 58) then --Paralaze
				if(not trust:hasRecast(dsp.recast.RECAST_MAGIC, spellId, 0)) then
					if(not target:hasStatusEffect(dsp.effect.PARALYSIS)) then
						return spellId
					end
				end
			end
		end
	end
	return 0
end

function checkDamageSpell(damageSpells, trust, target)
	for i, spell in ipairs(damageSpells) do
		local spellId = spell:getSpellID()
		if(trust:getMP() >= trust:getSpellCost(spellId)) then
			if(not trust:hasRecast(dsp.recast.RECAST_MAGIC, spellId, 0)) then
				return spellId
			end
		end
	end
	return 0
end

function checkDispelSpell(debuffSpells)
	for i, spell in ipairs(debuffSpells) do
		local spellId = spell:getSpellID()
		if(spellId == 260) then --Dispel
			return spellId
		end
	end
	return 0
end

function checkCure(healSpells, trust, master)
	local party = master:getParty()
	local trusts = master:getPartyTrusts()
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
			
			for i, member in pairs(party) do
				if(member:getHPP() <= healPercent) then
					return spellId, member
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