---------------------------------------------
-- Amber Scutum
-- Family: Wamouracampa
-- Description: Increases defense.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.DEFENSE_BOOST;

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60));

    return typeEffect;
end;
