---------------------------------------------
--
-- Death Trap (SlenderMan custom version)
--
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STUN;
    local duration = 10;
    local power = 1;

    if(math.random() <= 0.5) then
        -- stun
        typeEffect = EFFECT_POISON;
        duration = 60;
        power = mob:getMainLvl() / 3;
    end

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, 0, duration));

    return typeEffect;
end;
