-----------------------------------
-- Ability: Tabula Rasa
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)

	local regenbonus = 0;
	if (player:getMainJob() == JOB_SCH and player:getMainLvl() >= 20) then
		regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
	end
	
	local helixbonus = 0;
	if (player:getMainJob() == JOB_SCH and player:getMainLvl() >= 20) then
		helixbonus = math.floor(player:getMainLvl() / 5) - 3;
	end

	player:addStatusEffect(EFFECT_TABULA_RASA,helixbonus,0,180,0,regenbonus);

    return EFFECT_TABULA_RASA;
end;