---------------------------------------------
--  Miasma
--
--  Description: Releases a toxic cloud on nearby targets. Additional effects: Slow + Poison + Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
    duration = 180;

    isEnfeeble = true;
    statmod = MOD_INT;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(EFFECT_POISON) == nil) then
            target:addStatusEffect(EFFECT_POISON,1,10,duration);
        end
		if(target:getStatusEffect(EFFECT_SLOW) == nil) then
            target:addStatusEffect(EFFECT_SLOW,20,0,duration);
        end
		if(target:getStatusEffect(EFFECT_PLAGUE) == nil) then
            target:addStatusEffect(EFFECT_PLAGUE,25,0,duration);
        end
    end
	
    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_WIPE_SHADOWS);
    target:delHP(dmg);
	
    return dmg;
end;