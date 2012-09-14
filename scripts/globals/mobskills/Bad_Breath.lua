---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)    

    isEnfeeble = true;
    typeEffect = EFFECT_SLOW;
    statmod = MOD_INT;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,15,0,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end

    typeEffect2 = EFFECT_POISON;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect2,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect2) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect2,mob:getMainLvl()/10 + 10,3,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end

	typeEffect3 = EFFECT_SILENCE;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect3,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect3) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect3,1,0,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end

	typeEffect4 = EFFECT_PARALYSIS;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect4,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect4) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect4,18,0,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end

	typeEffect6 = EFFECT_BIND;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect6,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect6) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect6,1,0,30);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end

	typeEffect7 = EFFECT_BLINDNESS;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect7,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect7) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect7,15,0,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end
	
	typeEffect5 = EFFECT_WEIGHT;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect5,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect5) == nil) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect5,30,0,60);
        else
            skill:setMsg(MSG_NO_EFFECT);
        end
    else
        skill:setMsg(MSG_MISS);
    end	
	dmgmod = 1;
    accmod = 1.5;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;