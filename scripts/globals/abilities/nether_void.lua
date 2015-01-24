-----------------------------------
-- Ability: Nether Void
-- Increases the absorption of your
-- next dark magic spell.
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
	local power = 50;
	local legs = target:getEquipID(SLOT_LEGS);

	power = power + player:getMod(MOD_NETHER_VOID);

	player:addStatusEffect(EFFECT_NETHER_VOID,power,0,60);
end;