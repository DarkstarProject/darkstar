---------------------------------------------
--  Exuviation
--  Family: Wamoura
--  Type: Healing and Full Erase
--  Range: Self
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
    local heal = 300;
    local effectCount = 0;
    local dispel = mob:eraseStatusEffect();
    
    while (dispel ~= EFFECT_NONE)
    do
        effectCount = effectCount + 1;
        dispel = mob:eraseStatusEffect();
    end;

    if (effectCount > 0) then
        skill:setMsg(MSG_SELF_HEAL);
        return MobHealMove(mob, (heal * effectCount));
    else
        skill:setMsg(MSG_NO_EFFECT);
        return 0;
    end;
end;