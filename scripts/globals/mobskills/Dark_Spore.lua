---------------------------------------------
--  Dark Spore
--
--  Description: Unleashes a torrent of black spores in a fan-shaped area of effect, dealing dark damage to targets. Additional effect: Blind
--  Type: Magical Dark (Element)
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
    local typeEffect = EFFECT_BLINDNESS;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
        if(resist > 0.1) then
            target:addStatusEffect(typeEffect,30,0,math.random(45,120));--tic=3;duration=30;
        end
    end

    local dmgmod = MobBreathMove(mob, target, 0.25, 3);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    return dmg;
end;
