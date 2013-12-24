-----------------------------------
--  Area: Kazham
--   NPC: Lulupp
--  Type: Standard NPC
-- @zone: 250
--  @pos -26.567 -3.5 -3.544
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
local path = {
-27.457125, -3.043032, -22.057966,
-27.373426, -2.772481, -20.974442,
-27.103289, -2.500000, -17.846378,
-26.864126, -2.500000, -15.667570,
-26.532335, -2.500000, -16.636086,
-26.505196, -2.500000, -15.471632,
-26.509424, -2.500000, -14.359641,
-26.564587, -2.500000, -4.499783,
-26.574417, -2.500000, -5.523735,
-26.580530, -2.500000, -6.591716,
-26.583765, -2.500000, -8.555706,
-26.501217, -2.500000, -16.563267,
-26.504532, -2.500000, -15.427269,
-26.509769, -2.500000, -14.327281,
-26.565643, -2.500000, -4.247434,
-26.573967, -2.500000, -5.299402,
-26.579763, -2.500000, -6.379386,
-26.580465, -2.500000, -8.155381
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
	player:startEvent(0x00c5);
	npc:wait(-1);
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

function onEventFinish(player,csid,option,npc)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	npc:wait(0);
end;

