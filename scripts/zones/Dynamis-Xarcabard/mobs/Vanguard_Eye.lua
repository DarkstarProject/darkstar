-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Vanguard_Eye
-- Map Position: http://images.wikia.com/ffxi/images/c/cc/Xar.jpg
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

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
    dynamis.spawnGroup(mob, xarcabardList, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	local mobID = mob:getID();
	
	-- 035 039: spawn 043 when defeated
	if (mobID == 17326536) then
		SpawnMob(17326553);
	-- 058: spawn 60 when defeated
	elseif (mobID == 17326661 and GetMobAction(17326668) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326668 and GetMobAction(17326661) == 0 and GetMobAction(17326673) == 0 or 
		   mobID == 17326673 and GetMobAction(17326661) == 0 and GetMobAction(17326668) == 0) then
		SpawnMob(17326706);
	-- 114: spawn 112 when defeated
	elseif (mobID == 17326790) then
		SpawnMob(17326086);
	-- 144-149: spawn 150 when defeated
	elseif (mobID >= 17330913 and mobID <= 17330918) then
		SetServerVariable("[DynaXarcabard]TE150_Trigger",GetServerVariable("[DynaXarcabard]TE150_Trigger") + (mobID - 17330912) ^ 2);
	end
	
	if (GetServerVariable("[DynaXarcabard]TE150_Trigger") == 63) then
		SpawnMob(17330919); -- 150
	end
	
end;
