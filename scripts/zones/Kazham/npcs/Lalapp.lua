-----------------------------------
-- Area: Kazham
-- NPC: Lalapp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");
require("scripts/globals/pathfind");

local path = {
-63.243702, -11.000023, -97.916130,
-63.970551, -11.000027, -97.229286,
-64.771614, -11.000030, -96.499062
};

function onSpawn(npc)
    npc:initNpcAi();
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
	player:startEvent(0x00CD);
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

function onEventFinish(player,csid,option,npc)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	npc:wait(0);

end;



