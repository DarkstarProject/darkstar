-----------------------------------
-- Area: Bastok Markets
-- NPC: Salimah
-- Start & Finishes Quest: Gourmet
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

Gourmet = player:getQuestStatus(BASTOK,GOURMET);

	if (Gourmet ~= QUEST_AVAILABLE and player:needToZone() == false) then
		count = trade:getItemCount();
		hasSleepshroom = trade:hasItemQty(4374,1);
		hasTreantBulb = trade:hasItemQty(953,1);
		hasWildOnion = trade:hasItemQty(4387,1);
				
		if (hasSleepshroom or hasTreantBulb or hasWildOnion) then
			vanatime = VanadielHour();
			event = "0x00cb";
			item = "4387";

			if (hasSleepshroom) then
				item = "4374";
				if (vanatime>=18 or vanatime<6) then
					event = "0x00ca";
				end
			elseif (hasTreantBulb) then
				item = "953";
				if (vanatime>=6 and vanatime<12) then
					event = "0x00ca";
				end
			elseif (vanatime>=12 and vanatime<18) then
				event = "0x00c9";
			end

			player:startEvent(event,item);
		end
	end
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Gourmet = player:getQuestStatus(BASTOK,GOURMET);

	if (Gourmet ~= QUEST_AVAILABLE and player:needToZone()) then
		player:startEvent(0x0079);
	else
		player:startEvent(0x00c8);
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

Gourmet = player:getQuestStatus(BASTOK,GOURMET);

	if (csid == 0x00c8) then
		if (Gourmet == QUEST_AVAILABLE) then
			player:addQuest(BASTOK,GOURMET);
		end
	elseif (csid ~= 0x0079) then
		player:tradeComplete();
		if (Gourmet == QUEST_ACCEPTED) then
			player:completeQuest(BASTOK,GOURMET);
		end

		gil=350;
		fame=120;
		if (csid == 0x00ca) then
			gil=200;
		elseif (csid == 0x00cb) then
			gil=100;
			fame=60;
		end
		
		player:addGil(gil);
		player:messageSpecial(GIL_OBTAINED,gil);
		player:addFame(BASTOK,BAS_FAME*fame);
		player:setTitle(MOMMYS_HELPER);
		player:needToZone(true);
	end

end;