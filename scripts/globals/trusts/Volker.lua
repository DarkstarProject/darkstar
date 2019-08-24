-----------------------------------
--  Trust: Volker
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/ability")
require("scripts/globals/msg")
require("scripts/globals/magicburst")

-----------------------------------------------------------------------------------
--  Spawn/Despawn Functions
-----------------------------------------------------------------------------------
function onTrustSpawn(trust)
    local master = trust:getMaster();
	
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.VOLKER);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.VOLKER);
	trust:setDamage(trust:getMainLvl() * 2);
	trust:setMod(dsp.mod.STR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.DEX,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.VIT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.AGI,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.INT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MND,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.CHR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ATT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ACC,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.EVA,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.DEF,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	
	if master:hasTrust(dsp.trust.KLARA) then
	    trust:PrintToArea("Captain? Or are you her daughter?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.CID) then
	    trust:PrintToArea("Ah, Cid, always plunging yourself into the fray. Some things never change.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.NAJI) then
	    trust:PrintToArea("Forget anything, Naji? Got your shoes on the right feet this time?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("With Volker, leader of the Mythril Musketeers, at your side, you've nothing to fear!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustDeath(trust, player)
    trust:PrintToArea("Could it be I am...unfit to lead?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
	trust:PrintToArea("A good adventure always rests well on the heart!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

-----------------------------------------------------------------------------------
--  Battle Functions
-----------------------------------------------------------------------------------
function onTrustEngaged(trust,target)
    local master = trust:getMaster();
	if(not checkForTank(trust, master) and not trust:hasRecast(dsp.recast.RECAST_ABILITY, 5, 0)) then -- Provoke Recast
		trust:useTrustAbility(dsp.jobAbility.PROVOKE, target)
	end
end

function onTrustFight(trust,target)
end

function onTrustDisengage(trust,target)
end


-----------------------------------------------------------------------------------
--  Action Check Functions
-----------------------------------------------------------------------------------
function onSpellPrecast(trust, spell)
end;

-- Provoke(5), Berserk(15), Defender(25), Warcry(35), Retaliation(60), Warrior's Charge(75)
function onTrustSkillCheck(target, trust, skill)	
    local master = trust:getMaster();
	
	if(skill:getID() == dsp.jobAbility.PROVOKE) then -- Provoke
		if(not checkForTank(trust,master) and not trust:hasRecast(dsp.recast.RECAST_ABILITY, 5, 0)) then -- Provoke Recast
			return 0
		end
	elseif(skill:getID() == dsp.jobAbility.BERSERK) then -- Berserk
		if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, 3, 0)) then -- Defender Recast
			if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, 1, 0))then -- Berserk Recast
				return 0
			end
		end
	elseif(skill:getID() == dsp.jobAbility.DEFENDER) then -- Defender
		if(not checkForTank(trust,master) and not trust:hasRecast(dsp.recast.RECAST_ABILITY, 1, 0))then -- Berserk Recast
			if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, 3, 0)) then -- Defender Recast
				return 0
			end
		end
	elseif(skill:getID() == dsp.jobAbility.WARCRY) then -- Warcry
		if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, 2, 0))then -- Warcry Recast
			return 0
		end
	elseif(skill:getID() == dsp.jobAbility.RETALIATION) then -- Retaliation
		if(trust:hasTopEnmity(target)) then
			if(not checkForTank(trust,master) and not trust:hasRecast(dsp.recast.RECAST_ABILITY, 8, 0))then -- Retaliation Recast
				return 0
			end
		end
	elseif(skill:getID() == dsp.jobAbility.WARRIORS_CHARGE) then -- Warrior's Charge(used only with WS)
		return 1
	end
	
	return 1
end;

function onTrustWeaponSkillCheck(target, trust, skill)
	if(trust:getTP() > 2000) then
		if(trust:hasStatusEffect(dsp.effect.WARRIOR_S_CHARGE)) then -- Warrior's Charge Effect
			if(skill:getID() ~= 3205) then
				return 0
			end
		else
			if(skill:getID() == 3205) then
				if(not trust:hasStatusEffect(dsp.effect.ATTACK_BOOST)) then
					return 0
				end
			else
				if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, 6, 0))then -- Warrior's Charge Recast
					trust:useTrustAbility(dsp.jobAbility.WARRIORS_CHARGE)
					return 1
				end
			end
		end
	end
	
	return 1
end

function checkForTank(CTrust, master)
	local party = master:getParty()
	local trusts = master:getPartyTrusts()
	local tank = false;
	
	for i, member in pairs(party) do
		local job = member:getMainJob()
		if(job == dsp.job.WAR or job == dsp.job.PLD or job == dsp.job.NIN or job == dsp.job.DNC or job == dsp.job.RUN) then
			tank = true;
		end
	end
	for i, trust in pairs(trusts) do
		if(CTrust:getID() ~= trust:getID()) then
			local job = trust:getMainJob()
			if(job == dsp.job.WAR or job == dsp.job.PLD or job == dsp.job.NIN or job == dsp.job.DNC or job == dsp.job.RUN) then
				tank = true;
			end
		end
	end
	return tank
end