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
	local skill = player:getWeaponSkillType(SLOT_MAIN);
	local anim = 36;
	if skill <= 1 then
		anim = 37;
	elseif skill <= 3 then
		anim = 36;
	elseif skill == 4 then
		anim = 41;
	elseif skill == 5 then
		anim = 28;
	elseif skill <= 7 then
		anim = 40;
	elseif skill == 8 then
		anim = 42;
	elseif skill == 9 then
		anim = 43;
	elseif skill == 10 then
		anim = 44;
	elseif skill == 11 then
		anim = 39;
	elseif skill == 12 then
		anim = 45;
	else
		anim = 36;
	end
	return 0, anim, 1;
end;