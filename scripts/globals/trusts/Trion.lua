-----------------------------------
--  Trust: Trion
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")
require("scripts/globals/ability")


-----------------------------------------------------------------------------------
--  Spawn/Despawn Functions
-----------------------------------------------------------------------------------
function onTrustSpawn(trust)
	trust:addMobMod(dsp.mobMod.SKILL_LIST, dsp.trust.TRION);
    trust:addMobMod(dsp.mobMod.SPECIAL_SKILL, dsp.trust.TRION);
	
	trust:setDamage(trust:getMainLvl() * 2);
	trust:setMod(dsp.mod.STR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.DEX,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.VIT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.AGI,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.INT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MND,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.CHR,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ATT,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.MATT, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.ACC,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SWORD));
	trust:setMod(dsp.mod.EVA,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.DEF,  trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	trust:setMod(dsp.mod.MDEF, trust:getMaxSkillLevel(trust:getMainLvl(), dsp.job.PLD, dsp.skill.SHIELD));
	
    local master = trust:getMaster();
	if master:hasTrust(dsp.trust.RAHAL) then
	    SendPartyMessage(trust, "Ever the worrywort, Rahal. Take some of the concern and use it to formulate a plan of action!");
	elseif master:hasTrust(dsp.trust.HALVER) then
	    SendPartyMessage(trust, "Halver, I bid you save idle chitchat for later.");
	elseif master:hasTrust(dsp.trust.CURILLA) then
	    SendPartyMessage(trust, "Curilla, my spirit is high with you by my side. Come, let the flash of our blades light up the battlefield!");
	else
		SendPartyMessage(trust, "I am Trion, prince of San d'Oria. May my blade lead us to victory this day!");
	end
end

function onTrustDeath(trust, player)
    SendPartyMessage(trust, "There was nothing further I could have done!");
end

function onTrustDespawn(trust)
	SendPartyMessage(trust, "Sweet will be the aroma of the 812 Rolanberry I sip tonight!");
end

-----------------------------------------------------------------------------------
--  Battle Functions
-----------------------------------------------------------------------------------
function onTrustEngaged(trust,target)
	if(not trust:hasRecast(dsp.recast.RECAST_ABILITY, dsp.jobAbility.PROVOKE, 0)) then
		trust:useTrustAbility(dsp.jobAbility.PROVOKE)
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

function onTrustSkillCheck(target, trust, skill)
	return 0
end;

function onTrustWeaponSkillCheck(target, trust, skill)
	
	if(skill:getID() == 972) then -- Royal Savior
		if(not trust:hasStatusEffect(dsp.effect.DEFENSE_BOOST)) then
			return 0
		end
	end
	return 1
end;