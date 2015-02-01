-----------------------------------
-- Ability: Astral Conduit
-- Eliminates Blood Pact recast
-- times and fully recovers MP when
-- used. 
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
	local mMP = player:getMaxMP();
	local cMP = player:getMP();
	player:messageBasic(25,0,player:addMP(mMP - cMP));
	player:addStatusEffect(EFFECT_ASTRAL_CONDUIT,1,0,30);
	return EFFECT_ASTRAL_CONDUIT;
end;