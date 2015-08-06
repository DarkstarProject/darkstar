---------------------------------------------
-- Fulmination
--
-- Description: Deals heavy magical damage in an area of effect. Additional effect: Paralysis + Stun
-- Type: Magical
-- Wipes Shadows
-- Range: 30 yalms
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobSkin = mob:getModelId();

    if (mobSkin == 1805) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_LIGHTNING,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_WIPE_SHADOWS);

    MobStatusEffectMove(mob,target,EFFECT_PARALYSIS, 40, 0, 60);
    MobStatusEffectMove(mob,target,EFFECT_STUN, 1, 0, 4);
    -- TODO: Hits all players near Khimaira, not just alliance.
    target:delHP(dmg);

    return dmg;
end;