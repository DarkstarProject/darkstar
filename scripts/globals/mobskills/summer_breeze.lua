---------------------------------------------
-- Summer Breeze
--
-- Description: AoE Erase dsp.effects. (If nothing to Erase, it instead gains Regain.)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local erase = mob:eraseStatusEffect();

    if (erase ~= dsp.effects.NONE) then
        skill:setMsg(msgBasic.SKILL_ERASE);
        return erase;
    else
        skill:setMsg(MobBuffMove(mob, dsp.effects.REGAIN, 10, 3, 60));
        return dsp.effects.REGAIN;
    end
end;
