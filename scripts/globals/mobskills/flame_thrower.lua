---------------------------------------------------
-- Flame_Thrower
-- Description: Uses a flamethrower that deals Fire damage to players in a fan-shaped area of effect. Additional effect: Plague
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(MOBMOD_SKILL_LIST);
    local mobhp = mob:getHPP();
    local phase = mob:getLocalVar("battlePhase");

    if ((skillList == 729 and phase >= 1 and phase <= 2) or (skillList == 728 and mobhp < 70 and mobhp >= 40)) then
        return 0;
    end

    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PLAGUE;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 5, 3, 30);

    local dmgmod = 2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;