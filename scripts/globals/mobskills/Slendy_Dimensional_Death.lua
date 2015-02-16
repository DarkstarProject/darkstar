---------------------------------------------------
--
-- Dimensional Death (SlenderMan's custom version)
--
-- Dark based magic dmg, damaged targets TP,
-- and dispels 1 positive effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local effect = target:dispelStatusEffect();

    if (effect ~= EFFECT_NONE) then
        skill:setMsg(MSG_DISAPPEAR);
    end

    local dmgmod = 2.1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,ELE_DARK,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:addTP(-(dmg/3));
    target:delHP(dmg);
    return dmg;
end;
