---------------------------------------------
--  Stygian Vapor
--
--  Description: AoE Powerful plague
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = 0;
    local currentMsg = MSG_NONE;
    local msg = MSG_NONE;

    msg = MobStatusEffectMove(mob, target, EFFECT_CURSE_I, 25, 0, 180);

    if(msg == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_CURSE_I;
        currentMsg = msg;
    end

    msg = MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 25, 0, 60);

    if(msg == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_BLINDNESS;
        currentMsg = msg;
    end

    msg = MobStatusEffectMove(mob, target, EFFECT_SLEEP_I, 1, 0, 60);

    if(msg == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_SLEEP_I;
        currentMsg = msg;
    end

    skill:setMsg(currentMsg);

    return typeEffect;
end;
