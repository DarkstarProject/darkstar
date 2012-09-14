---------------------------------------------
--  Abrasive Tantara
--
--  Description: Inflicts amnesia in an area of effect
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 10' as well as single target outside of 10'
--  Notes: Doesn't use this if its horn is broken.  It is possible for Abrasive Tantara to miss. - See discussion
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)


    power = 1;
    tic = 0;
    duration = 30;

    isEnfeeble = true;
    typeEffect = EFFECT_AMNESIA;
    statmod = MOD_INT;
    accrand = math.random(1,6);
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.3 and accrand ~= 1) then
        if(target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,power,tic,duration);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
    return typeEffect;

end;