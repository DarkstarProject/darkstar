---------------------------------------------
--  Shadow Spread
--
--  Description: A dark shroud renders any nearby targets blinded, asleep, and cursed.
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect;
    local statmod = MOD_INT;
    local resist;

    typeEffect = EFFECT_CURSE_I;
    if(target:hasStatusEffect(typeEffect) == false) then
        resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_DARK);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,25,0,300);--power=18;tic=0;duration=60;
        end
    end

    typeEffect = EFFECT_SLEEP_I;
    if(target:hasStatusEffect(typeEffect) == false) then
        resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_DARK);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,1,0,math.random(25,30));--power=1;tic=0;duration=30;
        end
    end

    typeEffect = EFFECT_BLINDNESS;
    if(target:hasStatusEffect(typeEffect) == false) then
        resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_DARK);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,20,0,180);--power=15;tic=0;duration=60;
        end
    end

    return 1;
end;
