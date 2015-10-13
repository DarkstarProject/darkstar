-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Vznguard_Eye
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
package.loaded["scripts/zones/Dynamis-Beaucedine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Beaucedine/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, beaucedineHydraList, 5);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	local mobID = mob:getID();
	
	-- Time Bonus: 120 147
	if (mobID == 17326553 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	elseif (mobID == 17326706 and mob:isInBattlefieldList() == false) then
		killer:addTimeToDynamis(15);
		mob:addInBattlefieldList();
	-- 117 spawn 148 when defeated
	elseif (mobID == 17326721) then
		SpawnMob(17326553);
	-- 138 139 140: Spawn 147 when defeated
	elseif (mobID == 17326661 and GetMobAction(17326668) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326668 and GetMobAction(17326661) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326673 and GetMobAction(17326661) == 0 and GetMobAction(17326668) == 0) then
		SpawnMob(17326706);
	-- 157 spawn 158-162 when defeated
	elseif (mobID == 17326790) then
		SpawnMob(17326086);
		SpawnMob(17326087);
		SpawnMob(17326088);
		SpawnMob(17326089);
		SpawnMob(17326090);
	end
	
end;
