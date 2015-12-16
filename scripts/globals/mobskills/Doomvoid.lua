---------------------------------------------
--  Doomvoid
--
--  Description: Teleports all alliance members within 25' distance of itself into another zone to fight
-- 	a high level, shaworeign version, HNM for 60 mins.
--  
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	if (mob:getHPP() > 35) then
        return 1;
    end
    return 0;
end;
	

function onMobWeaponSkill(target, mob, skill,killer,ally,zone)
	
	
	local zone = target:getZoneID();
	local random = 0;
	random = math.random(10);
		
	
	if (mob:getLocalVar"KingArthroFight" == 1) then
		SpawnMob(17129519);
		target:setPos(-19.938, -8.750, -320.105, 65, 86);
		
		end
		
	if (mob:getLocalVar"LambtonWormFight" == 1) then
		SpawnMob(17129532);
		target:setPos(-241.068, 0, -402.123, 60, 86);
		
		end
		
	if (mob:getLocalVar"SerketFight" == 1) then
		SpawnMob(17305666);
		target:setPos(102.365,-0.206,-295.594, 60, 129);
		end
		
	if (mob:getLocalVar"LambtonWormFight" == 2) then
		SpawnMob(17305667);
		target:setPos(-323.390, 0, -419.010, 60, 129);
		end
		
		
	if (mob:getLocalVar"GuivreFight" == 1) then
		SpawnMob(17158202);
		target:setPos(-20.541, 0, 249.768, 60, 93);
		
		end
		
	if (mob:getLocalVar"LambtonWormFight" == 3) then
		SpawnMob(17158202);
		target:setPos(347.866, 0, -460.499, 100, 93);
		end
		
	
		if (mob:getID() == 17129532 or  mob:getID() == 17158203 or mob:getID() == 17305667) then
		MobBuffMove(mob, EFFECT_MAGIC_SHIELD, 5, 0, 30);
		MobBuffMove(mob,EFFECT_PHYSICAL_SHIELD,5,0,30);
		mob:setMsg(MSG_BUFF);
		
	
		end
		
end;
