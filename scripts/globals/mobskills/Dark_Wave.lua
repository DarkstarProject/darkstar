---------------------------------------------
--  Dark Wave
--
--  Description: A wave of dark energy washes over targets in an area of effect. Additional effect: Bio
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' radial
--  Notes: Severity of Bio effect varies by time of day, from 8/tic at midday to 20/tic at midnight.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

	cTime = VanadielHour();
	Power = 8;
	if(12 <= cTime) then
		power = power + (cTime - 11);
	end
    tic = 3;
    duration = 30;

    isEnfeeble = true;
    typeEffect = EFFECT_BIO;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end
    dmgmod = .9;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;