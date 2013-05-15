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
	player:addStatusEffect(EFFECT_TABULA_RASA,0,0,180);

    return EFFECT_TABULA_RASA;
end;