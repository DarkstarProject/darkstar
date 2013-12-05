-----------------------------------
-- Ability: Shadowbind
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

	local duration = 30 + player:getMod(MOD_SHADOW_BIND_EXT);

	if(100 * math.random() >= target:getMod(MOD_BINDRES)) then
		target:addStatusEffect(EFFECT_BIND,target:speed(),0,duration)
	end
end;


