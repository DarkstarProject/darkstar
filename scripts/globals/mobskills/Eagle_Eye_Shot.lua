---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 50) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = math.random(5,7);

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_RANGED,MOBPARAM_PIERCE,info.hitslanded);

    if(dmg > 0) then
       target:addTP(2);
       mob:addTP(8);
    end

    target:delHP(dmg);

    return dmg;
end;
