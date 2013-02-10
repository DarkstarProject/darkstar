---------------------------------------------
--  Glacier Splitter
--
--  Description: Cleaves into targets in a fan-shaped area. Additional effect: Paralyze
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadows
--  Range: Unknown cone
--  Notes: Only used the Aern wielding a sword (RDM, DRK, and PLD).
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = math.random(1,3);
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

	local typeEffect = EFFECT_PARALYSIS;
	if(target:hasStatusEffect(typeEffect) == false and MobPhysicalHit(skill, dmg, target, info.hitslanded)) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_IE);
		if(resist > 0.2) then
			target:addStatusEffect(typeEffect,15,3,60*resist);
		end
	end

	target:delHP(dmg);
	return dmg;
end;
