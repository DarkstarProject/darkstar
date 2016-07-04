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
    local power1 = 50;
    local power2 = 20;
    local duration = 300;

    skill:setMsg(MobBuffMove(mob, typeEffect1, power1, 0, duration));
    MobBuffMove(mob, typeEffect2, power2, 0, duration);

    return typeEffect1;
end;
