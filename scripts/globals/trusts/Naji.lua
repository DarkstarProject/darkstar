-----------------------------------
--  Trust: Naji
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

function onTrustSpawn(trust)
    local master = trust:getMaster();
	
	if(master:getVar("BastokFirstTrust") == 1) then
		master:setVar("BastokFirstTrust", 2);
	end
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.NAJI);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.NAJI);
	trust:setDamage(trust:getMainLvl() * 2);
	--trust:capSkill(dsp.skill.SWORD);
	--trust:capSkill(dsp.skill.SHIELD);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SWORD));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.WAR, dsp.skill.SHIELD));
	
	if master:hasTrust(dsp.trust.AYAME) then
	    trust:PrintToArea("Ayame, once this is all over, I...have something to tell you...", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("All right! Let me at 'em!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustEngaged(trust,target)
end

function onTrustDeath(trust, player)
	trust:PrintToArea("He'll never let me hear the end of this...!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
	trust:PrintToArea("Just one more step on my road to glory!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end;

function onTrustSkillCheck(target, trust, skill)
	return 0
end;

function onTrustWeaponSkillCheck(target, trust, skill)
	return 0
end