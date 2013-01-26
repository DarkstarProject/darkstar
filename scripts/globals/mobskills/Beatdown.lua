---------------------------------------------------
-- Beatdown
-- Deals damage to a single target. Additional effect: bind
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local numhits = 1;
    local accmod = 1;
    local dmgmod = 3;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);

    local typeEffect = EFFECT_BIND;
    if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
        if(resist > 0.2) then
            local mobTP = mob:getTP();
            local duration = mob:getMainLvl()/3.75;
            if(mobTP <= 100) then
                duration = 5 + duration;
            elseif(mobTP <= 200) then
                duration = 10 + duration;
            else
                duration = 15 + duration;
            end
            target:addStatusEffect(typeEffect,1,0,duration);
        end
    end

    return dmg;
end;
