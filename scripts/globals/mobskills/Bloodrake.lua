---------------------------------------------
--  Bloodrake
--
--  Description: Slashes up a single target. Additional effect: Drain
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow?
--  Range: Melee
--  Notes: A spell equivalent to Sanguine Blade in terms of functionality where damage dealt is absorbed as health recovered.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    numhits = 1;
    accmod = 1;
    dmgmod = .8;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
    target:delHP(dmg);
    mob:addHP(dmg);
    skill:setMsg(MSG_DRAIN_HP);
    return dmg;
end;