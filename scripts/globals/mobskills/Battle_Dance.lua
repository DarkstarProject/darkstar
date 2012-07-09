---------------------------------------------
--  Battle Dance
--
--  Description: Delivers an area attack. Additional effect: DEX Down. Duration of effect varies with TP.
--  Type: Physical (Slashing)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    duration = ((skill:getTP()/100) * 15) + 75;  -- TP changes duration length
	
    isEnfeeble = true;
    typeEffect = EFFECT_DEX_DOWN;
    statmod = MOD_INT;
    
    resist = applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,50,0,duration);
	end
    end

    numhits = 1;
    accmod = 1;
    dmgmod = 2;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;