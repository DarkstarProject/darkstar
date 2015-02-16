---------------------------------------------
--
-- Wrath of Zeus (Minerva's custom version)
--
-- AoE lightning damage and AoE silence
-- Grants custom EnThunder and Shock Spikes effects.
-- 
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES, 10, 0, 600);
    target:addStatusEffect(EFFECT_SILENCE, 1, 0, 90);
    mob:addStatusEffect(EFFECT_ENTHUNDER, 1, 0, 600);

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 2.5,ELE_LIGHTNING,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHTNING,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
