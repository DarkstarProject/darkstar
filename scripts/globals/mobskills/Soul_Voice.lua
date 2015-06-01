---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 70) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SOUL_VOICE;
    MobBuffMove(mob, typeEffect, 1, 0, 180);

    skill:setMsg(MSG_USES);
    return typeEffect;
end;
