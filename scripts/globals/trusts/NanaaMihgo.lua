-----------------------------------
--  Trust: Nanaa_Mihgo
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

function onTrustSpawn(trust)
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.NANAA_MIHGO);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.NANAA_MIHGO);
	trust:setDamage(trust:getMainLvl() * 2);
	--trust:capSkill(dsp.skill.DAGGER);
	trust:setMod(dsp.mod.DESPOIL, 60);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.EVASION));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.THF, dsp.skill.DAGGER));

	trust:setMod(dsp.mod.GILFINDER, 1);
	trust:setMod(dsp.mod.TREASURE_HUNTER, 1);

    local master = trust:getMaster();
	if master:hasTrust(dsp.trust.ROMAA_MIHGO) then
	    trust:PrintToArea("Rrromaa? And what's that smell? It can't be....!?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("Looking to make a new frrriend, are we?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustEngaged(trust,target)
end

function onTrustDeath(trust, player)
    local master = trust:getMaster();
    trust:PrintToArea("Uuurk...and to think, there were so many more trrreasures to be nabbed!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
    local master = trust:getMaster();
	trust:PrintToArea("Now you know how dangerous it is to be a prrroductive member of society!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end;

function onTrustSkillCheck(target, trust, skill)
	return 0
end;