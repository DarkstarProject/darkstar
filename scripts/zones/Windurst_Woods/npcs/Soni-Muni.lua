-----------------------------------
--	Area: Windurst Woods
--	NPC: Soni-Muni
--	Starts & Finishes Quest: The Amazin' Scorpio
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);

	if (AmazinScorpio == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		ScorpionStinger = trade:hasItemQty(1017,1);

		if (ScorpionStinger == true and count == 1) then
			player:startEvent(0x01e4);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);
Fame = player:getFameLevel(WINDURST);

	if (AmazinScorpio == QUEST_COMPLETED) then
		player:startEvent(0x01e5);
	elseif (AmazinScorpio == QUEST_ACCEPTED) then
		player:startEvent(0x01e2);
	elseif (AmazinScorpio == QUEST_AVAILABLE and Fame >= 2) then
		player:startEvent(0x01e1);
	else
		player:startEvent(0x01a5);
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

	if (csid == 0x01e1) then
		player:addQuest(WINDURST,THE_AMAZIN_SCORPIO);
	elseif (csid == 0x01e4) then
		player:completeQuest(WINDURST,THE_AMAZIN_SCORPIO);
		player:addFame(WIN_FAME*80);
		player:setTitle(GREAT_GRAPPLER_SCORPIO);
		player:addGil(GIL_RATE*1500);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
		player:tradeComplete();
	end
	
end;




