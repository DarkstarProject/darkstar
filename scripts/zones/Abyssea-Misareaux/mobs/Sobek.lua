-----------------------------------
--  Area: Abyssea - Misareaux (216)
--   Mob: Sobek
-----------------------------------
package.loaded["scripts/globals/abyssea"] = nil;
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_MATT,25);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_REGAIN,33);	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)	
	WeaknessTriggerSet(mob,target,ws,spell);
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
	-- local keyId = KEYITEM_ID_HERE;
	if (killer:getVar("RED_PROC") == 1) then
		-- if (killer:hasKeyItem(keyId) == false) then    --[[ Uncomment to use]]--
			-- killer:addKeyItem(keyId);
			-- killer:messageSpecial( KEYITEM_OBTAINED, keyId );
		-- end
	end

	if (killer:getVar("BLUE_PROC") == 1) then
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);	--[[ Uncomment to use]]--
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
	end

	if (killer:getVar("YELLOW_PROC") == 1) then
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);	--[[ Uncomment to use]]--
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
	end
	-- DoExp(mob,killer);
	-- DoCruor(mob,killer);
    -- DoLights(mob,killer);
	-- PyxisSpawn(mob,killer,npc);
end;

