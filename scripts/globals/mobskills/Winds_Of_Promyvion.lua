---------------------------------------------
--  Geist Wall
--
--  Description: Party memory erase.
--  Type: Enfeebling
--  Notes: Removes one detrimental magic effect for party members within area of effect.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local dispel = target:eraseStatusEffect();

    if(dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end;