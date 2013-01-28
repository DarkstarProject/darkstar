---------------------------------------------
--  Cold Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Bind.
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
    local typeEffect = EFFECT_BIND;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,5);
        if(resist > 0.2) then
            local mobTP = mob:getTP();
            local duration = mob:getMainLvl()/3.75;
            if(mobTP <= 100) then
                duration = 10 + duration;
            elseif(mobTP <= 200) then
                duration = 15 + duration;
            else
                duration = 20 + duration;
            end
            target:addStatusEffect(typeEffect,1,0,duration);
        end
    end

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_ICE);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
