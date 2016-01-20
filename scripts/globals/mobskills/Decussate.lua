---------------------------------------------
--  Decussate
--
--  Description: Performs a cross attack on nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: 2-3 shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja when below 35% health.
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getPool() == 1846 and mob:getHP() < mob:getMaxHP()/100 * 35) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.2;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_EARTH,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,math.random(2,3)*info.hitslanded);

    target:delHP(dmg);
    return dmg;
end;