-----------------------------------
--  Trust: Excenmille
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

function onTrustSpawn(trust)
    local master = trust:getMaster();
	
	if(master:getVar("SandoriaFirstTrust") == 1) then
		master:setVar("SandoriaFirstTrust", 2);
	end
	
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.EXCENMILLE); --Abilities
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.EXCENMILLE); --WeaponSkills
	trust:setDamage(trust:getMainLvl() * 2);
	--trust:capSkill(dsp.skill.POLEARM);
	trust:setMod(dsp.mod.STR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.DEX, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.VIT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.AGI, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.INT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.MND, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.CHR, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.ATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.ACC, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.POLEARM));
	trust:setMod(dsp.mod.EVA, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.DEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	
	trust:setMod(dsp.mod.UNDEAD_KILLER, 5);
	trust:setMod(dsp.mod.STORETP, 3);
	
	--trust:addTrustTrait(dsp.trait.TRAIT_STORE_TP, 3);
	--trust:addTrustTrait(dsp.trait.TRAIT_UNDEAD_KILLER, 1);
	
	if master:hasTrust(dsp.trust.RAHAL) then
	    trust:PrintToArea("Rahal, your loyalty, prowess, and dedication as a knight of virtue are beyond parallel.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("Excenmille M Aurchiat, ready at your side!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end
end

function onTrustDeath(trust, player)
    trust:PrintToArea("A fate wholly undeserving of one blessed with fifth prize in the latest mog bonanza...", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustDespawn(trust)
	trust:PrintToArea("Tonight we dine and drink to tales of valor!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end

function onTrustSkillCheck(target, trust, skill)
	return 0
end;

-----------------------------------
--  ACTIONS
-----------------------------------

--function onTrustEngaged(trust,target)
--end

--function onTrustDisengage(trust)
--end

--function onTrustFight(trust,target)
--end

--function onTrustSpellCheck(trust, spell)
--    local master = trust:getMaster();
--end

--function onTrustWeaponSkillCheck(trust, player)
--    local master = trust:getMaster();
--end

--function onTrustAbilityCheck(trust, target, ability)
--    local master = trust:getMaster();
--end

--function onTrustCast(trust, target)
--    local master = trust:getMaster();
--end

--function onTrustWeaponSkill(trust, target, wSkill, tp, primary, action)
--    local master = trust:getMaster();
--end

--function onTrustAbility(trust, target, ability, action)
--    local master = trust:getMaster();
--end

