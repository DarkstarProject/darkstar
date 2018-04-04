---------------------------------------------
-- Cyclonic Turmoil
--
-- Deals Wind damage in an area of effect. Additional effect: Knockback & Dispel
-- Notes: Dispels multiple buffs. Wipes shadows.
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
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.8,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);
    local dispel1 = target:dispelStatusEffect();
    local dispel2 = target:dispelStatusEffect();
    local total = 0;

    if (dispel1 ~= dsp.effects.NONE) then
        total = total+1;
    end

    if (dispel2 ~= dsp.effects.NONE) then
        total = total+1;
    end

    target:delHP(dmg);

    if (total == 0) then
        return dmg;
    else
        skill:setMsg(msgBasic.DISAPPEAR_NUM);
        return total;
    end
end;
