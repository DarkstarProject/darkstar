-----------------------------------
--  Area: Southern San d'Oria@
--   NPC: Hinaree
--  Type: Standard NPC
-- @zone: 230
--  @pos: -301.535 -10.199 97.698
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
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
        if(player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status")==6 )then
        player:startEvent(0x0017);
        else
	player:startEvent(0x0244);
	end
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
	if (csid == 0x0017)then
	 player:setVar("EMERALD_WATERS_Status",7);  --end 3-3A: San d'Oria Route: "Emerald Waters"
	end
end; 

