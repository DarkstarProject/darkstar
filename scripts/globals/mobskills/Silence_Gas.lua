---------------------------------------------
--  Silence Gas
--
--  Description: Emits a noxious cloud in a fan-shaped area of effect, dealing Wind damage to all targets. Additional effect: silence
--  Type: Magical Wind (Element)
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
    local typeEffect = EFFECT_SILENCE;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
        if(resist > 0.1) then
            target:addStatusEffect(typeEffect,1,0,45);--tic=3;duration=30;
        end
    end

    local dmgmod = mob:getHP() / mob:getMaxHP() * (mob:getMainLvl()/9);
    local accmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*math.random(1.5,2.5),accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);

    -- most breaths cap off at 500
    if(dmg > 500) then
        dmg = dmg * 0.7;
    end

    target:delHP(dmg);
    return dmg;
end;
