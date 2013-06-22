-----------------------------------
-- Area: Kazham
-- NPC: Mumupp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

path = {
94.732452, -15.000000, -114.034622,
94.210846, -15.000000, -114.989388,
93.508865, -15.000000, -116.274101,
94.584877, -15.000000, -116.522118,
95.646988, -15.000000, -116.468452,
94.613518, -15.000000, -116.616562,
93.791100, -15.000000, -115.858505,
94.841835, -15.000000, -116.108437,
93.823380, -15.000000, -116.712860,
94.986847, -15.000000, -116.571831,
94.165512, -15.000000, -115.965698,
95.005806, -15.000000, -116.519707,
93.935555, -15.000000, -116.706291,
94.943497, -15.000000, -116.578346,
93.996826, -15.000000, -115.932816,
95.060165, -15.000000, -116.180840,
94.081062, -15.000000, -115.923836,
95.246490, -15.000000, -116.215691,
94.234077, -15.000000, -115.960793
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
	player:startEvent(0x00C7);
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
	GetNPCByID(17801290):wait(0);
end;



