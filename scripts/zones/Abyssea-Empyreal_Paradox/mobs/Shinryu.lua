-----------------------------------
--  Area: Abyssea - Empyreal Paradox (255)
--   Mob: Shinryu
-----------------------------------
-----------------------------------
package.loaded["scripts/zones/Abyssea-Empyreal_Paradox/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-- package.loaded["scripts/globals/abyssea"] = nil;
-------------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-- require("scripts/globals/abyssea");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");

-----------------------------------
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
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
	-- WeaknessTriggerSet(mob,target,ws,spell);
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

	killer:getBCNMloot();
	--[[
	-- local keyId = KEYITEM_ID_HERE;
	if (killer:getVar("RED_PROC") == 1) then
		-- if (killer:hasKeyItem(keyId) == false) then -- Uncomment to use
			-- killer:addKeyItem(keyId);
			-- killer:messageSpecial( KEYITEM_OBTAINED, keyId );
		-- end
	end

	if (killer:getVar("BLUE_PROC") == 1) then
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate); -- Uncomment to use
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
	end

	if (killer:getVar("YELLOW_PROC") == 1) then
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate); -- Uncomment to use
		-- SetDropRate(dropID,itemID,newrate);
		-- SetDropRate(dropID,itemID,newrate);
	end
	]]
end;

