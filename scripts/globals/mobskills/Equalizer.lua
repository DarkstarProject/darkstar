---------------------------------------------------
-- Equalizer
-- AoE damage (~600-800),
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
    local phase = mob:getLocalVar("battlePhase");

    if ((skillList == 729 and phase >= 2 and phase <= 3) or (mobhp < 40 and mobhp > 20 and skillList == 728)) then
        return 0;
    end

    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2;
    local accmod = 1;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    target:delHP(dmg);
    return dmg;
end;