---------------------------------------------
-- Summer Breeze
--
-- Description: AoE Erase effect. (If nothing to Erase, it instead gains Regain.)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local erase = mob:eraseStatusEffect();

    if (erase ~= EFFECT_NONE) then
        skill:setMsg(MSG_DISAPPEAR);
        return erase;
    else
        skill:setMsg(MobBuffMove(mob, EFFECT_REGAIN, 10, 3, 60));
        return EFFECT_REGAIN;
    end
end;
