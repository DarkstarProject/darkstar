-----------------------------------
--  Area: West Ronfaure
--  NPC:  Signpost
--  @zone 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
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
	if (npc:getID() == 17187473) then
		player:startEvent(109);
	elseif (npc:getID() == 17187471) then
		player:startEvent(107);
	elseif (npc:getID() == 17187472) then
		player:startEvent(108);
	elseif (npc:getID() == 17187473) then
		player:startEvent(109);
	elseif (npc:getID() == 17187474) then
		player:startEvent(110);
	elseif (npc:getID() == 17187475) then
		player:startEvent(115);
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
end;

