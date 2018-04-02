---------------------------------------------
---  Shadow Spread
---
---  Description: A dark shroud renders any nearby targets blinded, asleep, and cursed.
---
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
    local typeEffect = 0;
    local currentMsg = msgBasic.NONE;
    local msg = msgBasic.NONE;

    msg = MobStatusEffectMove(mob, target, dsp.effects.CURSE_I, 25, 0, 300);

    if (msg == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effects.CURSE_I;
        currentMsg = msg;
    end

    msg = MobStatusEffectMove(mob, target, dsp.effects.BLINDNESS, 20, 0, 180);

    if (msg == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effects.BLINDNESS;
        currentMsg = msg;
    end

    msg = MobStatusEffectMove(mob, target, dsp.effects.SLEEP_I, 1, 0, 30);

    if (msg == msgBasic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effects.SLEEP_I;
        currentMsg = msg;
    end

    skill:setMsg(currentMsg);

    return typeEffect;
end;
