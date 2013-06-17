-----------------------------------
-- Area: Lower Jeuno
-- NPC: Navisse
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");
require("scripts/globals/pathfind");

path = {
	-74, 6, -111,
	-66.8, 6, -98,
	-63, 6, -86.9,
	-52.7, 6, -75,
	-48.6, 6, -66.2
};

function onSpawn(npc)
	npc:setPos(pathfind.first(path));
	onPath(npc);
end;

function onPath(npc)
	pathfind.patrol(npc, path);
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
	player:startEvent(0x0099);
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
	GetNPCByID(17780794):wait(0);
end;



