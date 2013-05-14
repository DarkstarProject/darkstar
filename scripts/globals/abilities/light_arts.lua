-----------------------------------
-- Ability: Light Arts
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	player:delStatusEffect(EFFECT_DARK_ARTS);
	player:delStatusEffect(EFFECT_ADDENDUM_BLACK);
	player:delStatusEffect(EFFECT_PARSIMONY);
	player:delStatusEffect(EFFECT_ALACRITY);
	player:delStatusEffect(EFFECT_MANIFESTATION);
	player:delStatusEffect(EFFECT_EBULLIENCE);
	player:delStatusEffect(EFFECT_FOCALIZATION);
	player:delStatusEffect(EFFECT_EQUANIMITY);
	player:delStatusEffect(EFFECT_IMMANENCE);
	
	local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
	local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
	
	--Get the B+ skill cap for the casters level
	local newCap = player:getMaxSkillLevel(ENHANCING_MAGIC_SKILL, JOB_RDM, player:getMainLvl());
	
	local currEnhancing = player:getSkillLevel(ENHANCING_MAGIC_SKILL);
	local currEnfeebling = player:getSkillLevel(ENFEEBLING_MAGIC_SKILL);
	local currDivine = player:getSkillLevel(DIVINE_MAGIC_SKILL);
	local currHealing = player:getSkillLevel(HEALING_MAGIC_SKILL);
	
	local newEnhancing = 0;
	local newEnfeebling = 0;
	local newDivine = 0;
	local newHealing = 0;
	
	--and get the new skill (new cap minus the difference between the current cap and current skill)
	--todo: pass the value to add instead of set
	if (player:getMainJob() == JOB_SCH) then
		newEnhancing = newCap - (player:getMaxSkillLevel(ENHANCING_MAGIC_SKILL, JOB_SCH, player:getMainLvl()) - currEnhancing)
		newEnfeebling = newCap - (player:getMaxSkillLevel(ENFEEBLING_MAGIC_SKILL, JOB_SCH, player:getMainLvl()) - currEnfeebling)
		newDivine = newCap - (player:getMaxSkillLevel(DIVINE_MAGIC_SKILL, JOB_SCH, player:getMainLvl()) - currDivine)
		newHealing = newCap - (player:getMaxSkillLevel(HEALING_MAGIC_SKILL, JOB_SCH, player:getMainLvl()) - currHealing)
	else
		newEnhancing = newCap - (player:getMaxSkillLevel(ENHANCING_MAGIC_SKILL, JOB_SCH, math.floor(player:getMainLvl()/2)) - currEnhancing)
		newEnfeebling = newCap - (player:getMaxSkillLevel(ENFEEBLING_MAGIC_SKILL, JOB_SCH, math.floor(player:getMainLvl()/2)) - currEnfeebling)
		newDivine = newCap - (player:getMaxSkillLevel(DIVINE_MAGIC_SKILL, JOB_SCH, math.floor(player:getMainLvl()/2)) - currDivine)
		newHealing = newCap - (player:getMaxSkillLevel(HEALING_MAGIC_SKILL, JOB_SCH, player:getMainLvl()) - currHealing)
	end
	
	player:addStatusEffect(EFFECT_LIGHT_ARTS,10 + effectbonus,0,7200, newEnhancing, newEnfeebling, );

    return EFFECT_LIGHT_ARTS;
end;