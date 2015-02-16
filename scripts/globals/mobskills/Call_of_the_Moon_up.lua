---------------------------------------------
--  Call of the Moon
--
--  All players and Campaign NPCs will be intimidated for a short time.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if (mob:AnimationSub() == 0) then
		return 1;
	else	
	return 0;
	end
end;

function onMobWeaponSkill(target, mob, skill)
	
	skill:setMsg(MobBuffMove(mob, EFFECT_INTIMIDATE, 30, 0, 60));
	return EFFECT_INTIMIDATE;
end;
