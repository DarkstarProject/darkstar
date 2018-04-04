---------------------------------------------
-- Light of Penance
--
-- Description: Reduces an enemy's TP. Additional effect: Blindness and "Bind".
-- Type: Magical (Light)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local tpReduced = 0;
    target:setTP(tpReduced);

    MobGazeMove(mob, target, dsp.effects.BLINDNESS, 20, 0, 120);

    MobGazeMove(mob, target, dsp.effects.BIND, 1, 0, 30);

    skill:setMsg(msgBasic.TP_REDUCED);

    return tpReduced;
end;
