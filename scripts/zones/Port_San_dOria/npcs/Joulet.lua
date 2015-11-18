-----------------------------------
--  Area: Port San d'Oria
--   NPC: Joulet
--  Starts The Competition
-- @zone: 232
--  @pos -18 -2 -45

-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/keyitems");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	MoatCarp = trade:getItemQty(4401)
	ForestCarp = trade:getItemQty(4289)
	fishCountVar = player:getVar("theCompetitionFishCountVar");
	if (MoatCarp + ForestCarp > 0 and MoatCarp + ForestCarp == count) then
		if (player:getQuestStatus(SANDORIA,THE_COMPETITION) == QUEST_ACCEPTED and fishCountVar >= 10000) then -- ultimate reward
			player:tradeComplete();
			player:addFame(SANDORIA,SAN_FAME*30);
			player:addGil((GIL_RATE*10*MoatCarp) + (GIL_RATE*15*ForestCarp));
			player:messageSpecial(GIL_OBTAINED,MoatCarp*10 + ForestCarp*15);
			player:startEvent(0x0133);
		elseif (player:getQuestStatus(SANDORIA,THE_COMPETITION) >= QUEST_ACCEPTED) then -- regular turn-ins. Still allowed after completion of the quest.
			player:tradeComplete();
			player:addFame(SANDORIA,SAN_FAME*30);
			player:addGil((GIL_RATE*10*MoatCarp) + (GIL_RATE*15*ForestCarp));
			totalFish = MoatCarp + ForestCarp + fishCountVar
			player:setVar("theCompetitionFishCountVar",totalFish);
			player:startEvent(0x0131);
			player:messageSpecial(GIL_OBTAINED,MoatCarp*10 + ForestCarp*15);
		else
			player:startEvent(0x0132);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(SANDORIA,THE_COMPETITION) == QUEST_AVAILABLE and player:getQuestStatus(SANDORIA,THE_RIVALRY) == QUEST_AVAILABLE) then -- If you haven't started either quest yet
		player:startEvent(0x0130);
	end
	-- Cannot find his "default" dialogue so he will not respond to being activated unless he is starting the quest event.
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
	
	if (csid == 0x0133) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17386);
		else
			player:tradeComplete();
			player:addItem(17386);
			player:messageSpecial(ITEM_OBTAINED, 17386);
			player:addTitle(CARP_DIEM);
			player:addKeyItem(TESTIMONIAL);
			player:messageSpecial(KEYITEM_OBTAINED,TESTIMONIAL);
			player:setVar("theCompetitionFishCountVar",0);
			player:completeQuest(SANDORIA,THE_COMPETITION);
		end
	elseif (csid == 0x0130 and option == 700) then	
		player:addQuest(SANDORIA,THE_COMPETITION);
	end
end;