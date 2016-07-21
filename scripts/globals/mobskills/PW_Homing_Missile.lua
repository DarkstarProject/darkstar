---------------------------------------------------
-- Homing Missle
--
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- See PW's script
    local phase = mob:getLocalVar("phase");

    if (phase == 4) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local targetcurrentHP = target:getHP();
    local targetmaxHP = target:getMaxHP();
    local hpset = targetmaxHP * 0.20;

    if (targetcurrentHP > hpset) then
        dmg = targetcurrentHP - hpset;
    else
        dmg = 0;
    end

    target:delHP(dmg);
    return dmg;
end;