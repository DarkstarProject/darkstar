---------------------------------------------
-- Mind Purge
--
-- Description: Dispels all buffs from a single target, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: Single target
-- Notes:
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
    local dispel =  target:dispelAllStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));
    local msg; -- to be set later

    if (dispel == 0) then
        msg = msgBasic.SKILL_NO_EFFECT; -- no effect
    else
        msg = msgBasic.DISAPPEAR_NUM;
    end

    skill:setMsg(msg);

    return dispel;
end
