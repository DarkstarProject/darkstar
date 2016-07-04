---------------------------------------------
--  Voidsong
--
--  Description: Removes all status effects in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20' radial
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- can only used if not silenced
    if (mob:getMainJob() == JOBS.BRD and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)

    mob:eraseAllStatusEffect();
    local count = target:dispelAllStatusEffect();
    count = count + target:eraseAllStatusEffect();

    if (count == 0) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        skill:setMsg(MSG_DISAPPEAR_NUM);
    end

    return count;
end;