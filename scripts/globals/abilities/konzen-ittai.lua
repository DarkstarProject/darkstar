-----------------------------------
-- Ability: Konzen-Ittai
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/weaponskills");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getAnimation() ~= 1) then
		return MSGBASIC_REQUIRES_COMBAT,0;
	else
		return 0,0;		
	end
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffectEx(EFFECT_CHAINBOUND, 0, 2, 0, 5, 0, 1);
	return 0, getFlourishAnimation(player:getWeaponSkillType(SLOT_MAIN)), 1;
end;