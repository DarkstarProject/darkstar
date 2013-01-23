---------------------------------------------
--  Vacuous Osculation
--
--  Description: Deals damage to a single target. Additional effect: Poison, Plague
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    if(target:hasStatusEffect(EFFECT_PLAGUE)) then
        return 1;
    end
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = math.random(2,3);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);


    if(MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
        local typeEffect = EFFECT_POISON;
        if(target:hasStatusEffect(typeEffect) == false) then
            local power = (mob:getMainLvl()/8);
            if (power < 1 ) then
                power = 1;
            end
            target:addStatusEffect(typeEffect,power,3,120);
        end

        if(target:hasStatusEffect(EFFECT_PLAGUE) == false) then
            target:addStatusEffect(EFFECT_PLAGUE,5,3,math.random(30,60));
        end
    end

    target:delHP(dmg);
    return dmg;
end;
