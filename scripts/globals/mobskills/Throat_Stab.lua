---------------------------------------------
--  Throat Stab
--
--  Description: Deals damage to a single target reducing their HP to 5%. Resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Very short range, easily evaded by walking away from it.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
    numhits = 1;
    accmod = 1;
    dmgmod = 1;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    fivePercent = ((target:getMaxHP()/100)*5);
    currentHP = target:getHP();
    if(currentHP > fivePercent and info.dmg > 0) then
    	dmg = currentHP - fivePercent;
    else
    	dmg = 0;
    end
    dmg = MobFinalAdjustments(dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_IGNORE_SHADOWS);

    target:delHP(dmg);
    mob:updateEnmity(target,-300,1); -- no way to remove entity from enmity table currently as Clear() does not work.
    return dmg;
end;