---------------------------------------------
--  Cannonball
--  Family: Wamouracampa
--  Description: Damage varies with TP.
--  Type: Physical
--  Utsusemi/Blink absorb: One shadow
--  Range: 20
--  Notes: Uses defense instead of attack. Curled form only.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() ~=1) then
        return 1;
    else
        return 0;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 1.75;
    local offcratio = mob:getStat(MOD_DEF);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.75,2.125,2.75,offcratio);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;
