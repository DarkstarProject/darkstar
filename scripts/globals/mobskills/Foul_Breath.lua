---------------------------------------------
--  Foul Breath
--
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

    local typeEffect = EFFECT_DISEASE;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
        if(resist > 0.1) then
            target:addStatusEffect(typeEffect,1,0,540);--power=1;tic=0;duration=120;
        end
    end

    local dmgmod = mob:getHP() / mob:getMaxHP() * 5;
    local accmod = 1;

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

    if(dmg > 500) then
        dmg = 500;
    end

    target:delHP(dmg);
    return dmg;
end;
