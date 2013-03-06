-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Wyatt
-- @zone 80
-- @pos 124 0 84
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)


	if (trade:hasItemQty(2506,4) and trade:getItemCount() == 4 and trade:getGil() == 0) then
		player:startEvent(0x004);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local seeingSpots = player:getQuestStatus(CRYSTAL_WAR,SEEING_SPOTS);
	if (seeingSpots == QUEST_AVAILABLE) then
		player:startEvent(0x002);
			
	elseif (seeingSpots == QUEST_ACCEPTED) then
		player:startEvent(0x003);
	
	else
		player:showText(npc, 10993); --Ahhh, sorry, sorry. The name's Wyatt, an' I be an armor merchant from Jeuno. Ended up 'ere in San d'Oria some way or another, though.
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

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 0x002) then
		player:addQuest(CRYSTAL_WAR,SEEING_SPOTS);

	elseif (csid == 0x004) then
		player:tradeComplete();
		if(player:getQuestStatus(CRYSTAL_WAR,SEEING_SPOTS) == QUEST_ACCEPTED) then
			player:addTitle(LADY_KILLER);
			player:addGil(GIL_RATE*3000);
			player:messageSpecial(GIL_OBTAINED,3000);
			player:completeQuest(CRYSTAL_WAR,SEEING_SPOTS);
			
		else
			player:addTitle(LADY_KILLER);
			player:addGil(GIL_RATE*1500);
			player:messageSpecial(GIL_OBTAINED,1500);
		end

	end

end;