---------------------------------------------
--  Leaf Dagger
--
--  Description: Deals piercing damage to a single target. Additional effect: Poison
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows
--  Range: Melee?
--  Notes: On higher level Madragoras (Korrigans for example) the poision is 5hp/tick for about 5-6 ticks, damaging a total of 25-30 HP.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)



    power = (mob:getMainLvl()/10);
	if (power < 1 ) then
		power = 1;
	end
		
    tic = 3;
    duration = 18;

    isEnfeeble = true;
    typeEffect = EFFECT_POISON;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end

    numhits = 1;
    accmod = 1;
    dmgmod = .7;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
	
end;