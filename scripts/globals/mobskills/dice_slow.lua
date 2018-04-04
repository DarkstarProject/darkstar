---------------------------------------------
-- Goblin Dice
--
-- Description: Stun
-- Type: Physical (Blunt)
--
--
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
    local slowed = false;
    local sleeped = false;

    slowed = MobStatusEffectMove(mob, target, dsp.effects.SLOW, 128, 0, 120);
    sleeped = MobStatusEffectMove(mob, target, dsp.effects.SLEEP_I, 1, 0, 30);

    skill:setMsg(msgBasic.SKILL_ENFEEB_IS);
    if (sleeped) then
        return dsp.effects.SLEEP_I;
    elseif (slowed) then
        return dsp.effects.SLOW;
    else
        skill:setMsg(msgBasic.SKILL_MISS); -- no effect
    end

    return typeEffect;
end;
