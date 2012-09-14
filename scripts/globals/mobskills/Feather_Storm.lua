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

    power = math.random(1,3);
    tic = 0;
    duration = 120;

    isEnfeeble = true;
    typeEffect = EFFECT_POISON;
    statmod = MOD_INT;
    resist = 1;--applyPlayerResistance(mob,skill,target,isEnfeeble,typeEffect,statmod);
    if(resist > 0.5) then
        if(target:getStatusEffect(typeEffect) == nil) then
            target:addStatusEffect(typeEffect,power,tic,duration);
        end
    end

    numhits = 1;
	accmod = 2;
	dmgmod = 3;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,info.hitslanded);
	target:delHP(dmg);
	
	printf("[TP MOVE] Zone: %u Monster: %u Mob lvl: %u TP: %u TP Move: %u Damage: %u on Player: %u Level: %u HP: %u",mob:getZone(),mob:getID(),mob:getMainLvl(),skill:getTP(),skill:getID(),dmg,target:getID(),target:getMainLvl(),target:getMaxHP());
	
	return dmg;

end;