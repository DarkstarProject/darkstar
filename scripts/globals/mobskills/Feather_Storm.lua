---------------------------------------------
--  Feather Storm
--  Description: Additional effect: Poison. Chance of effect varies with TP.
--  Type: Physical (Piercing)
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_POISON;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.5) then
			local power = math.random(1,3);
			target:addStatusEffect(typeEffect,power,3,120);--tic=0;duration=120;
		end
	end

	local numhits = 1;
	local accmod = 2;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
	target:delHP(dmg);

	printf("[TP MOVE] Zone: %u Monster: %u Mob lvl: %u TP: %u TP Move: %u Damage: %u on Player: %u Level: %u HP: %u",mob:getZone(),mob:getID(),mob:getMainLvl(),skill:getTP(),skill:getID(),dmg,target:getID(),target:getMainLvl(),target:getMaxHP());

	return dmg;
end;
