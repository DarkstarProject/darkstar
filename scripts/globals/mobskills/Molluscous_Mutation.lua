---------------------------------------------------
--  Molluscous Mutation
--
--  Family: Xzomit
--  Type: Enhancing
--  Can be dispelled: Yes
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes: ~75% Defense boost.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_DEFENSE_BOOST;
	skill:setMsg(MobBuffMove(mob, typeEffect, 75, 0, 60));

	return typeEffect;
end;
