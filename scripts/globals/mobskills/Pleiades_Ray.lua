---------------------------------------------
--  Pleiades Ray
--
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    power = 1;
    tic = 0;
    duration = 120;

    isEnfeeble = true;
    statmod = MOD_INT;
    
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(EFFECT_PARALYSIS) == nil) then
            target:addStatusEffect(EFFECT_PARALYSIS,40,tic,duration);
        end
		if(target:getStatusEffect(EFFECT_BLINDNESS) == nil) then
            target:addStatusEffect(EFFECT_BLINDNESS,40,tic,duration);
        end
		if(target:getStatusEffect(EFFECT_POISON) == nil) then
            target:addStatusEffect(EFFECT_POISON,power,10,duration);
        end
		if(target:getStatusEffect(EFFECT_PLAGUE) == nil) then
            target:addStatusEffect(EFFECT_PLAGUE,power,tic,duration);
        end
		if(target:getStatusEffect(EFFECT_BIND) == nil) then
            target:addStatusEffect(EFFECT_BIND,power,tic,duration);
        end
		if(target:getStatusEffect(EFFECT_SILENCE) == nil) then
            target:addStatusEffect(EFFECT_SILENCE,power,tic,duration);
        end
		if(target:getStatusEffect(EFFECT_SLOW) == nil) then
            target:addStatusEffect(EFFECT_SLOW,40,tic,duration);
        end
    end
	
    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
	
    return dmg;
end;