---------------------------------------------
--  Geist Wall
--
--  Description: Party memory erase.
--  Type: Enfeebling
--  Notes: Removes one detrimental magic effect for party members within area of effect.
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

    local dispel = target:eraseStatusEffect();

    if (dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(msgBasic.NO_EFFECT); -- no effect
    else
        skill:setMsg(msgBasic.DISAPPEAR);
    end

    return dispel;
end;