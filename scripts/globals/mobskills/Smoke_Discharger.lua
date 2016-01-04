---------------------------------------------------
--  Smoke_Discharger
--  Description:
--  Type: Magical
--  additional effect : Petrification.
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

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
    local typeEffect = EFFECT_PETRIFICATION;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 3, 15);

    local dmgmod = 2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_EARTH,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
