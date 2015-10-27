---------------------------------------------
--  Tortoise Song
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
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    local count = target:dispelAllStatusEffect(bit.bor(EFFECTFLAG_SONG, EFFECTFLAG_ROLL));

    if (count == 0) then
        skill:setMsg(MSG_NO_EFFECT);
    else
        skill:setMsg(MSG_DISAPPEAR_NUM);
    end

    return count;
end;