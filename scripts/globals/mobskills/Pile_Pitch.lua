---------------------------------------------------
--  Guided_Missile
--
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  ,Bind (30 sec)
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

    if ((skillList == 54 and mobhp < 26) or (skillList == 727 and mob:AnimationSub() == 1)) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local targetCurrentHP = target:getHP();
    local hpset = target:getMaxHP() * 0.05;
    local typeEffect = EFFECT_BIND;
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);

    if (targetCurrentHP > hpset) then
        dmg = targetCurrentHP - hpset;
    else
        dmg = 0;
    end

    target:delHP(dmg);
    return dmg;
end;
