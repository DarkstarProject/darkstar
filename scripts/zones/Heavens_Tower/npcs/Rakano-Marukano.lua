-----------------------------------
--  Area: Heavens Tower
--   NPC: Rakano-Marukano
--  Type: Immigration NPC
-- @zone: 242
--  @pos: 6.174 -1 32.285
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/globals/conquest");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	new_nation = WINDURST
	rank = getNationRank(new_nation)
	if(rank == 1) then
		cost = 40000
	elseif(rank == 2) then
		cost = 12000 
	elseif(rank == 3) then
		cost = 4000
	end
	has_gil = 0
	if(player:getGil() >= cost) then
		has_gil = 1
	end
	player:startEvent(0x2712,0,1,player:getRank(),new_nation,has_gil,cost);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	if(csid == 0x2712 and option == 1) then
		player:setNation(new_nation)
		player:setGil(player:getGil() - cost);
	end
end;

