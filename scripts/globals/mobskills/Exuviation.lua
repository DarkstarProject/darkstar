---------------------------------------------
--  Exuviation
--  Family: Wamoura
--  Type: Healing and Full Erase
--  Range: Self
--  Utsusemi/Blink absorb: N/A
--  Notes: Erases all negative effects on the mob and heals an amount for each removed.
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local baseHeal = 400;
    local statusHeal = 650;
    local effectCount = 0;
    local dispel = mob:eraseStatusEffect();
    
    while (dispel ~= EFFECT_NONE)
    do
        effectCount = effectCount + 1;
        dispel = mob:eraseStatusEffect();
    end;

    skill:setMsg(MSG_SELF_HEAL);
    return MobHealMove(mob, (statusHeal * (effectCount) + baseHeal));
end;