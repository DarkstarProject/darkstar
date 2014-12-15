-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Jailer of Faith Spawn)
-- Allows players to spawn the Jailer of Faith by trading 1 High-Quality Euvhi Organ to a ???.
-- @pos ,-260 0 -645 
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	--local mobspawn = GetMobByID(16921021);
	--local qm3 = GetNPCByID(16921029);
	-- Trade 1 High-Quality Euvhi Organ
	--if(GetMobAction(16921021) == 0 and trade:hasItemQty(1899,1) and trade:getItemCount() == 1) then
		--player:tradeComplete();
		--qm3:hideNPC(390); -- Hides ???.
		--mobspawn:setSpawn(player:getXPos(),player:getYPos(),player:getZPos()); -- Change MobSpawn to Players @pos.
		--SpawnMob(16921021,900):updateEnmity(player); -- Spawn Jailer of Faith
	--end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	end;