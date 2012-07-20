-----------------------------------
-- Ability: Seigan
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	if(target:isWeaponTwoHanded()) then
		target:delStatusEffect(EFFECT_HASSO);
		target:delStatusEffect(EFFECT_SEIGAN);
		target:addStatusEffect(EFFECT_SEIGAN,0,0,300);
	end
end;
