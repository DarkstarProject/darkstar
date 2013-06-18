-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Raminel
-- Involved in Quests: Riding on the Clouds
-- @zone 230
-- @pos -56 2 -21
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/pathfind");

path = { 
-13.179178, 1.700000, -29.541771,
-14.257055, 1.700000, -29.410273,
-15.281208, 1.700000, -29.207724,
-44.718952, 2.000000, -23.317883,
-56.851315, 2.000000, -20.877165,
-57.856297, 2.000000, -20.466452,
-58.799591, 2.000000, -19.924717,
-59.717842, 2.000000, -19.341475,
-60.606792, 2.000000, -18.714283,
-61.483273, 2.000000, -18.069721,
-63.114452, 2.000000, -16.844652,
-87.054741, 2.000000, 1.413027,
-105.950302, -2.000000, 15.819530,
-106.958084, -2.000000, 16.218168,
-108.036346, -2.000000, 16.354256,
-109.130630, -2.000000, 16.412849,
-110.226479, -2.000000, 16.429428,
-111.314438, -2.000000, 16.419821,
-112.818138, -2.000000, 16.393724,
-140.204636, -2.000000, 15.668795, -- package Lusiane
-139.145096, -2.000000, 15.696827,
-138.073517, -2.000000, 15.725569,
-108.808014, -2.000000, 16.503462,
-107.725479, -2.000000, 16.400141,
-106.706718, -2.000000, 16.031151,
-105.759300, -2.000000, 15.496902,
-104.850159, -2.000000, 14.899514,
-103.963707, -2.000000, 14.268646,
-103.088257, -2.000000, 13.622535,
-101.784393, -2.000000, 12.640894,
-77.905899, 2.000000, -5.566319,
-59.336224, 2.000000, -19.718527,
-58.396572, 2.000000, -20.264837,
-57.374714, 2.000000, -20.635946,
-56.321995, 2.000000, -20.910328,
-55.263222, 2.000000, -21.160738,
-54.201595, 2.000000, -21.398727,
-53.136860, 2.000000, -21.622494,
-23.615900, 2.000000, -27.539652
};


function onSpawn(npc)
	npc:setPos(pathfind.first(path));
	onPath(npc);
end;

function onPath(npc)

	if(npc:atPoint(pathfind.get(path, 20))) then
		local lus = GetNPCByID(17719350);

		-- give package to Lusiane
		npc:showText(lus, RAMINEL_DELIVERY);
		lus:showText(npc, LUSIANE_THANK);

		-- wait default duration 3 seconds
		-- then continue path
		npc:wait();
	elseif(npc:atPoint(pathfind.get(path, 21))) then
		local lus = GetNPCByID(17719350);

		-- when I walk away stop looking at me
		lus:clearTargID();
	end

	-- go back and forth the set path
	pathfind.patrol(npc, path);
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart Flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 1) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_1",0);
			player:tradeComplete();
			player:addKeyItem(SCOWLING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0266);

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

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	GetNPCByID(17719326):wait(0);
end;