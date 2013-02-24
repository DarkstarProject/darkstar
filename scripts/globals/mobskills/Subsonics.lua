---------------------------------------------------
-- Subsonics
-- Lower defense
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_DOWN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 180));


        return typeEffect;
end;
