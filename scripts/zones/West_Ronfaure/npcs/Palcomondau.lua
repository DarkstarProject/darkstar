-----------------------------------
--  Area: West Ronfaure
--   NPC: Palcomondau
--  Type: Patrol
-- @zone: 100
-- 
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

function onNpcInitialize(npc)
	npc:setPos(-217, -57, 379);

	npc:walkThrough({-264, -55, 378});
end;

function onNpcPathFinish(npc)
	if(npc:atPoint(-264, -55, 378)) then
		npc:walkThrough({-217, -57, 379});
	else
		npc:walkThrough({-264, -55, 378});
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc, PALCOMONDAU_DIALOG);
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

