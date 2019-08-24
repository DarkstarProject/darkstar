-----------------------------------
--  Trust: Curilla
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

function onTrustSpawn(trust)
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.CURILLA);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.CURILLA);
	trust:setDamage(trust:getMainLvl() * 2);
	--trust:capSkill(dsp.skill.SWORD);
	--trust:capSkill(dsp.skill.SHIELD);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	
    local master = trust:getMaster();
	if master:hasTrust(dsp.trust.RAHAL) then
	    trust:PrintToArea("Perhaps a small cup of Batallian tea will help lift your spirits, Rahal.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.RAINEMARD) then
	    trust:PrintToArea("Rainemard? But that...that was my kindhearted father's name...", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.TRION) then
	    trust:PrintToArea("Prince Trion, I pledge to protect you from harm...even if it means my life.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("Even the mightiest birds give their all when hunting the smallest of prey!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustEngaged(trust,target)
end

function onTrustDisengage(trust,target)
end

function onTrustFight(trust,target)

end

function onTrustDeath(trust, player)
    trust:PrintToArea("There is no excuse for my failure...I have sullied my own honor.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
	trust:PrintToArea("Was this...what it feels like to be on a rite of courtship?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onSpellPrecast(trust, spell)

end;

function onTrustSkillCheck(target, trust, skill)
	return 0
end;