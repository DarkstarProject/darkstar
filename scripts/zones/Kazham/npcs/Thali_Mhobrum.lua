-----------------------------------
-- Area: Kazham
-- NPC: Thali Mhobrum
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

local path = {
55.816410, -11.000000, -43.992680,
54.761787, -11.000000, -44.046181,
51.805824, -11.000000, -44.200321,
52.922001, -11.000000, -44.186420,
51.890709, -11.000000, -44.224312,
47.689358, -11.000000, -44.374969,
52.826096, -11.000000, -44.191029,
47.709465, -11.000000, -44.374393,
52.782181, -11.000000, -44.192482,
47.469643, -11.000000, -44.383091
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
    if (player:getVar("BathedInScent") == 1) then
        player:startEvent(0x00A3); -- scent from Blue Rafflesias
        npc:wait(-1);
	else
	player:startEvent(0x00BE);
	npc:wait(-1);
    end
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



