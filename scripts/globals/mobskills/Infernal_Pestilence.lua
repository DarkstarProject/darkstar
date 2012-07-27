---------------------------------------------
--  Infernal Pestilence
--
--  Description: Releases a horrible disease on targets in front.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Front arc
--  Notes: Only used by Chahnameed's Stomach.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)

    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
	
    return dmg;
end;