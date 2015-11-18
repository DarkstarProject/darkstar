-------------------------------------
-- Area: Southern San d'Oria
-- NPC: Glenne
-- Starts and Finishes Quest: A Sentry's Peril
-- @zone 230
-- @pos -122 -2 15
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

require("scripts/globals/pathfind");

local path = {
-121.512833, -2.000000, 14.492509,
-122.600044, -2.000000, 14.535807,
-123.697128, -2.000000, 14.615446,
-124.696846, -2.000000, 14.707844,
-123.606018, -2.000000, 14.601295,
-124.720863, -2.000000, 14.709210,
-123.677681, -2.000000, 14.608237,
-124.752579, -2.000000, 14.712106,
-123.669525, -2.000000, 14.607473,
-124.788277, -2.000000, 14.715488,
-123.792847, -2.000000, 14.619405,
-124.871826, -2.000000, 14.723736
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

    local count = trade:getItemCount();
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED and
        trade:hasItemQty(532,1) and count == 1) then
            player:messageSpecial(FLYER_REFUSED);

    elseif (player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL) == QUEST_ACCEPTED and
        trade:hasItemQty(601,1) and count == 1) then
            player:startEvent(0x0201);
            npc:wait(-1);
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	aSentrysPeril = player:getQuestStatus(SANDORIA,A_SENTRY_S_PERIL);

	npc:wait(-1);

	if (aSentrysPeril == QUEST_AVAILABLE) then
		player:startEvent(0x01fe);
	elseif (aSentrysPeril == QUEST_ACCEPTED) then
		if (player:hasItem(600) == true or player:hasItem(601) == true) then
			player:startEvent(0x0208);
		else
			player:startEvent(0x0284);
		end	
	elseif (aSentrysPeril == QUEST_COMPLETED) then
		player:startEvent(0x0209);
	else
		npc:wait(0);
	end
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,npc)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	npc:wait(5000);
	
	if (csid == 0x01fe and option == 0) then
		if (player:getFreeSlotsCount() > 0) then
			player:addQuest(SANDORIA,A_SENTRY_S_PERIL);
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,600); -- Dose of ointment
		end 	
	elseif (csid == 0x0284) then
		if (player:getFreeSlotsCount() > 0) then
			player:addItem(600);
			player:messageSpecial(ITEM_OBTAINED,600);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,600); -- Dose of ointment
		end
	elseif (csid == 0x0201) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12832); -- Bronze Subligar
		else
			player:tradeComplete();
			player:addTitle(RONFAURIAN_RESCUER);
			player:addItem(12832);
			player:messageSpecial(ITEM_OBTAINED,12832); -- Bronze Subligar
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,A_SENTRY_S_PERIL);
		end
	end
	
end;
