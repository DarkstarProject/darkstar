---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 50) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SOUL_VOICE;
    skill:setMsg(MobBuffMove(mob, typeEffect, 1, 0, 180));
    return typeEffect;
end;
