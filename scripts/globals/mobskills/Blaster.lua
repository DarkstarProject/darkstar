---------------------------------------------
--  Blaster
--
--  Description: Paralyzes enemy.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows.
--  Range: Melee?
--  Notes: Very potent paralysis effect. Is NOT a Gaze Attack, unlike Chaotic Eye.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    power = 50;
    tic = 0;
    duration = 60;

    isEnfeeble = true;
    typeEffect = EFFECT_PARALYSIS;
    statmod = MOD_INT;
    accrand = math.random(1,2);
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5 and accrand == 1) then
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