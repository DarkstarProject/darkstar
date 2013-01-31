---------------------------------------------
--  Kick Out
--
--  Description: Deals heavy damage and inflicts blind to any target behind user.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown cone, backwards
--  Notes:  Only used when the Behemoth is attacking with it's tail.
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(target:isBehind(mob) == false) then
        return 1;
    end
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = math.random(2,3);
	local accmod = 1;
	local dmgmod = 6 + math.random();
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

    local typeEffect = EFFECT_BLINDNESS;
    if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then --Let's first see if it's worth the time to do this math, since there's no messages to handle
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,8);
        if(resist > 0.2) then
            target:addStatusEffect(typeEffect,20,0,120);--power=1;tic=0;duration=60;
        end
    end

    target:delHP(dmg);
    return dmg;

end;