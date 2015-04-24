-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  ??? (Jailer of Faith Spawn)
-- Allows players to spawn the Jailer of Faith by trading 1 High-Quality Euvhi Organ to a ???.
-- @pos ,-260 0 -645 
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	 --Trade 1 High-Quality Euvhi Organ
	if(GetMobAction(Jailer_of_Faith) == 0 and trade:hasItemQty(1899,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		-- Hide the ???
		GetNPCByID(Jailer_of_Faith_QM):hideNPC(900);
		-- Change MobSpawn to Players @pos.
		GetMobByID(Jailer_of_Faith):setSpawn(player:getXPos(),player:getYPos(),player:getZPos());
		-- Spawn Jailer of Faith
		SpawnMob(Jailer_of_Faith,900):updateEnmity(player); 
	end
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

-----------------------------------
-- onGameHour
-----------------------------------

function onGameHour(npc, mob, player)
	local VanadielHour = VanadielHour();
	local s = math.random(6, 12); -- Random between 6 and 12 Vana Hours
	
	if (VanadielHour % s == 0) then -- Move it at random between 15 and 30 mins
		-- Get the ??? NPC 
		local qm3 = GetNPCByID(Jailer_of_Faith_QM);
		-- Hide it for 60 seconds
		qm3:hideNPC(60);
		
		-- Get a new random position from the possible places
		local qm3position = math.random(1,5);
		-- Set the new ??? place
		qm3:setPos(Jailer_of_Faith_QM_POS[qm3position][1], Jailer_of_Faith_QM_POS[qm3position][2], Jailer_of_Faith_QM_POS[qm3position][3]);
	end
end;