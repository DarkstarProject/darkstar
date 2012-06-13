-----------------------------------
--  Area: Temple of Uggalepih
--   NPC: Tonberry Priest
--  Type: Standard NPC
-- @zone: 159
--  @pos: 59.965 -1.01 -145.868
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
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
	killCount = player:getVar("EVERYONES_GRUDGE_KILLS");
	if(killCount >= 1) then
		payment = 240 * killCount;
		player:startEvent(0x0042,0,payment);
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
	if (csid == 0x0042 and option == 1) then
		player:delGil(payment);
		player:setVar("EVERYONES_GRUDGE_KILLS",0);
	end
end;

