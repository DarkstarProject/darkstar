---------------------------------------------------
-- Crystaline Cocoon
-- Family: Aern
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local typeEffect1 = EFFECT_PROTECT;
	local typeEffect2 = EFFECT_SHELL;

	skill:setMsg(MobBuffMove(mob, typeEffect1, 50, 0, 60));
	MobBuffMove(mob, typeEffect2, 50, 0, 60);

    return typeEffect1;
end;
