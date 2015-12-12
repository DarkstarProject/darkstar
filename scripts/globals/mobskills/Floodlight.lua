---------------------------------------------------
--  Floodlight
--
--  Description:  ~300 magic damage, Flash, Blind and Silence, ignores Utsusemi
--  Type: Magical
--
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

    if (mobID == 727 and mobhp > 30 and mobhp < 70  ) then -- omega first bipedform
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = EFFECT_BLINDNESS;
    local typeEffect2 = EFFECT_SILENCE;
    MobStatusEffectMove(mob, target, typeEffect1, 15, 3, 120);
    MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 60);

    local dmgmod = 1.5;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;