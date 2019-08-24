-----------------------------------
--  Trust: Ayame
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/ability")
require("scripts/globals/msg")
require("scripts/globals/magicburst")

function onTrustSpawn(trust)
    local master = trust:getMaster();
	
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.AYAME);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.AYAME);
	trust:setDamage(trust:getMainLvl() * 2);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.SAM, dsp.skill.GREAT_KATANA));
	

	if master:hasTrust(dsp.trust.NAJI) then
	    trust:PrintToArea("I am interested to see how you spar, Naji. Just let your breath be used for exertion, not mindless chatter.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.GILGAMESH) then
	    trust:PrintToArea("Gilgamesh, I'm twenty years old now. Can you please stop calling me Ayaya?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("Refining one's technique requires one to be their own harshest critic.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustEngaged(trust,target)
end

function onTrustDisengage(trust,target)
end

function onTrustFight(trust,target)
    --local master = trust:getMaster();
	--if(trust:hasTopEnmity(target)) then
		--use Third Eye if available
	--end
	--Check to see if you can use a WS based on master WS
end

function onTrustDeath(trust, player)
    trust:PrintToArea("There are no shortcuts to perfection.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
	trust:PrintToArea("Remember to hold your family close. They will be your rock in times of need.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustSkillCheck(target, trust, skill)
	local master = trust:getMaster();
	local mob = trust:getTarget();
	if(skill:getID() == dsp.jobAbility.MEDITATE) then -- Meditate
		if(master:getTP() >= 1000 and trust:getTP() < 1000) then	
			if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, dsp.jobAbility.MEDITATE, 0))then
				return 0
			end
		end
	end
	if(skill:getID() == dsp.jobAbility.HASSO) then -- Hasso
		if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, dsp.jobAbility.HASSO, 0))then
			return 0
		end
	end
	if(skill:getID() == dsp.jobAbility.THIRD_EYE) then -- Third Eye
		if(trust:getID() ~= mob:getID()) then
			if(trust:hasTopEnmity(mob) and not trust:hasRecast(dsp.recast.RECAST_ABILITY, dsp.jobAbility.THIRD_EYE, 0)) then	
				return 0
			end
		end
	end
	if(skill:getID() >= 144 and skill:getID() <= 152) then -- WS
		return 0
	end
	return 1
end;

function onTrustWeaponSkillCheck(target, trust, skill)
	local master = trust:getMaster();
	local masterLastWS = master:getLastWsUsed();
	local trustSkillList = trust:getTrustWSList();
	local chainTier = 0;
	local skillId = 0;

	if(trust:getTP() < 3000) then
		local wsEffect = target:getStatusEffect(dsp.effect.SKILLCHAIN, 0);
		
		if (wsEffect == nil and masterLastWS > 0 and master:getTP() >= 1000) then -- wsEffect doesnt exist
			for i, wskill in pairs(trustSkillList) do
				local skillchain = target:getFormSkillChain(wskill, masterLastWS);
				if(skillchain > chainTier) then
					chainTier = skillchain
					skillId = wskill
				end
			end
		end
		
		if(chainTier ~= 0 and skillId == skill:getID()) then
			return 0
		end
	end
	return 1
end

function onSpellPrecast(trust, spell)

end;