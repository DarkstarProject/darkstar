---------------------------------------------
--  Benthic Typhoon
--
--  Description: Delivers an area attack that lowers target's defense and magic defense. Damage varies with TP.
--  Type: Physical (Piercing)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 30;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_MAGIC_DEF_DOWN;
    statmod = MOD_INT;
    accrand = math.random(1,3);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end

    typeEffect = EFFECT_DEFENSE_DOWN;
    accrand = math.random(1,3);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
	
    numhits = 1;
    accmod = 1;
    dmgmod = .7;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;