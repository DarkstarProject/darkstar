---------------------------------------------
--  Tortoise Stomp
--
--  Description: Single target Defense Down effect.
--  Type: Physical
--  Utsusemi/Blink absorb:&nbsp;??
--  Range: Varying Area of Effect
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3 + math.random();
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

    local typeEffect = EFFECT_DEFENSE_DOWN;
    if(MobPhysicalHit(skill, info.dmg, target, info.hitslanded) and target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_EARTH);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,30,0,180);--power=30;tic=0;duration=120;
        end
    end

	target:delHP(dmg);
	return dmg;
end;
