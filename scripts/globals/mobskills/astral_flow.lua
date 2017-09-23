---------------------------------------------------
-- Astral Flow
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getMobMod(MOBMOD_SCRIPTED_2HOUR) == 1) then
        return 1;
    else
        return 0;
    end;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_ASTRAL_FLOW;
    skill:setMsg(msgBasic.USES);
    return typeEffect;
end;
