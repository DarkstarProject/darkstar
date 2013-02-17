---------------------------------------------------
-- Brain Drain
-- Deals damage to a single target. Additional effect: INT Down
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
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,info.hitslanded);

    local typeEffect = EFFECT_INT_DOWN;
    if(MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_FIRE);
        if(resist > 0.1) then
            target:delStatusEffect(typeEffect);
            target:addStatusEffect(typeEffect,10,0,120*resist);
        end
    end

    target:delHP(dmg);

    return dmg;
end;
