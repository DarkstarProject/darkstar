---------------------------------------------
--  Tachi: Yukikaze
--
--  Description:  Blinds target. Damage varies with TP. 
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(msgBasic.READIES_WS, 0, 690+256);
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.56,1.88,2.50);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    MobStatusEffectMove(mob, target, EFFECT_BLINDNESS, 25, 0, 60);

    -- Never actually got a good damage sample.  Putting it between Gekko and Kasha.
    target:delHP(dmg);
    return dmg;
end;
