-----------------------------------
--  Area: West Ronfaure
--   NPC: Palcomondau
--  Type: Patrol
-- @zone: 100
-- 
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/pathfind");

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


function onSpawn(npc)	
	npc:setPos(pathfind.first(path));
	onPath(npc);
end;

function onPath(npc)

	if(npc:atPoint(pathfind.first(path))) then

		npc:walkThrough(pathfind.fromStart(path));

	elseif(npc:atPoint(pathfind.last(path))) then

		local ada = GetNPCByID(17187461);

		npc:showText(ada, PALCOMONDAU_REPORT);

		-- go same path but backwards
		npc:walkThrough(pathfind.fromEnd(path));
		
		-- small delay after path finish
		npc:wait();
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
	npc:wait();
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

