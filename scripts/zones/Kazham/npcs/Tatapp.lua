-----------------------------------
-- Area: Kazham
-- NPC: Tatapp
-- Standard Merchant NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");


path = {
	33, -11, -30,
	34.7, -11, -64,
	60, -11, -65.5,
	57.4, -11.6, -83,
	53, -13, -91,
	60.7, -13.2, -95.6,
	76, -13, -95.5,
	71, -13, -130
};

function onInitialize(npc)
	npc:setPos(path[1], path[2], path[3]);
	npc:walkThrough(path);
end;

function onPathFinish(npc)
	
	if(npc:atPoint(path[1], path[2], path[3])) then

		npc:walkThrough(path);
	else
		npc:walkThrough(path, true);
	end

	npc:wait(4000);
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
	player:startEvent(0x00CB);
	npc:wait(-1);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	GetNPCByID(17801294):wait(0);
end;



