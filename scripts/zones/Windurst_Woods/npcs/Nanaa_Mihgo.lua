-----------------------------------
-- Area: Windurst Walls
-- NPC: Nanaa Mihgo
-- Starts and Finishes Repeatable Quest: Mihgo's Amigo
-- Involved In Quest: Crying Over Onions
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   
MihgosAmigo   = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);

	if (MihgosAmigo >= QUEST_ACCEPTED) then
		count = trade:getItemCount();
		YagudoBeadNecklace = trade:hasItemQty(498,4);
		
		if (YagudoBeadNecklace == true and count == 4) then
			player:startEvent(0x0058,GIL_RATE*200);
		end
	end
   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

CryingOverOnionsVar = player:getVar("CryingOverOnions");
MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);

	if (CryingOverOnionsVar == 1) then
		player:startEvent(0x0256);
	elseif (MihgosAmigo == QUEST_COMPLETED) then
		player:startEvent(0x0059);
	elseif (MihgosAmigo == QUEST_ACCEPTED) then
		player:startEvent(0x0052);
	elseif (MihgosAmigo == QUEST_AVAILABLE) then
		CryingOverOnions = player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);
		
		if (CryingOverOnions >= QUEST_ACCEPTED) then
			player:startEvent(0x0051);
		else	
			player:startEvent(0x0050);
		end
	else
		player:startEvent(0x004c);
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

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0050 or csid == 0x0051) then
		player:addQuest(WINDURST,MIHGO_S_AMIGO);
	elseif (csid == 0x0058) then
		MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);
		
		if (MihgosAmigo == QUEST_ACCEPTED) then
			player:completeQuest(WINDURST,MIHGO_S_AMIGO);
			player:addFame(3,NORG_FAME*60);
			player:setTitle(CAT_BURGLAR_GROUPIE);
			player:needToZone(true);
		else
			player:addFame(3,NORG_FAME*8);
		end
		
		player:tradeComplete();
		player:addGil(GIL_RATE*200);
	end

end;