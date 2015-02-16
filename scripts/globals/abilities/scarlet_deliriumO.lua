-----------------------------------
-- Ability: Scarlet Delirium
-- Channels dmg taken into enhanced
-- atk and magic atk. Dmg proportional
-- to next hit taken hp loss / 2.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)

	return 0,0;
end;

function OnUseAbility(player, target, ability)

	player:addStatusEffect(EFFECT_SCARLET_DELIRIUM_I,1,0,180);
end;