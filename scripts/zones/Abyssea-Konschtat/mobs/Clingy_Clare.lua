-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Clingy_Clare
-----------------------------------
package.loaded["scripts/globals/abyssea"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/textIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");

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
	WeaknessTriggerSet(mob,target,ws,spell);
end;

-----------------------------------
-- onMobFight
-----------------------------------


function onMobFight(mob,target)
	TriggerHint(mob,target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

end;

function onMobDeathEx(mob, killer, isWeaponSkillKill, action)
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
    -- DoLights(killer,mob,action)
	-- PyxisSpawn(mob,killer,npc);

end;