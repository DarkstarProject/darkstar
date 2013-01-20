---------------------------------------------------
-- Rampant Gnaw
-- Deals damage to a single target. Additional effect: Paralysis
-- Range: 10' cone
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PARALYSIS;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,20,0,120);--power=1;tic=0;duration=60;
        end
    end

    local dmgmod = math.random(2,3);
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
    target:delHP(dmg);
    return dmg;
end;
