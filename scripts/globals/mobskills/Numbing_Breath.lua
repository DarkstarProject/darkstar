---------------------------------------------
--  Numbing Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralyze.
--  Type: Magical Ice (Element)
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
    local typeEffect = EFFECT_PARALYSIS;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_ICE);
        if(resist > 0.1) then
            local mobTP = mob:getTP();
            local duration = mob:getMainLvl()/3.75;
            if(mobTP <= 100) then
                duration = 30 + duration;
            elseif(mobTP <= 200) then
                duration = 45 + duration;
            else
                duration = 60 + duration;
            end
            target:addStatusEffect(typeEffect,25,0,duration);
        end
    end

    local dmgmod = MobBreathMove(mob, target, 0.2, 1.875, ELE_ICE, 500);
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
