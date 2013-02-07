---------------------------------------------
--  Petro Gaze
--  Description: Petrifies opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
--  Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(target:getCurrentRegion() == 18) then
        return 0;
    end

    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PETRIFICATION;
    if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_EARTH);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            local power = math.random(10, 18) + mob:getMainLvl()/3;
            target:addStatusEffect(typeEffect,1,0,power);--power=1;tic=0;duration=180;
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
