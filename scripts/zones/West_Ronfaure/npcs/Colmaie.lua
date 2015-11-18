-----------------------------------
--  Area: West Ronfaure
--  NPC:  Colmaie
--  Type: Standard NPC
--  @pos -133.627 -61.999 272.373 100
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


	local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

	if (thePickpocket > 0) then
		player:showText(npc, 7263);
	else
		player:showText(npc, COLMAIE_DIALOG);
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

