-----------------------------------
--  Area: West Ronfaure
--   NPC: Palcomondau
--  Type: Patrol
-- @zone: 100
-- 
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

path = {
	-577, -56, 500,
	-549, -55, 497,
	-539, -55, 482,
	-539, -55, 474,
	-527, -55, 461,
	-505, -55, 454,
	-499, -56, 440,
	-503, -52, 423,
	-499, -46, 404,
	-500, -45, 342,
	-372, -46, 337,
	-347, -45, 343,
	-333, -45, 374,
	-296, -52, 382,
	-282, -55, 379,
	-184, -61, 380	
};

function onInitialize(npc)
	npc:setPos(path[1], path[2], path[3]);
	npc:walkThrough(path);
end;

function onPathFinish(npc)
	
	if(npc:atPoint(path[1], path[2], path[3])) then

		npc:walkThrough(path);
	else
		local ada = GetNPCByID(17187461);

		npc:showText(ada, PALCOMONDAU_REPORT);

		-- go same path but backwards
		npc:walkThrough(path, true);
	end

	-- small delay after path finish
	npc:wait(2000);
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
	npc:wait(2000);
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

