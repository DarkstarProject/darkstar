---------------------------------------------
--  Wind Breath
--
--  Description: Deals Wind breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Wind)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
    
	dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*5,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
	
end;