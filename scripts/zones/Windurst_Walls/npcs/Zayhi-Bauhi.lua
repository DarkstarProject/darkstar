-----------------------------------
--	Area: Windurst Walls
--  Location: X:-91  Y:-9  Z:109
--	NPC:  Zayhi-Bauhi
--	Working 100%
--  Starts and Finishes Quest: To Bee or Not to Bee?
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(WINDURST,TO_BEE_OR_NOT_TO_BEE) == QUEST_ACCEPTED) then 
        if (trade:hasItemQty(4370,1) and trade:getItemCount() == 1) then
            local ToBeeOrNotStatus = player:getVar("ToBeeOrNot_var");
            if (ToBeeOrNotStatus == 10) then 
                player:startEvent(0x0045); -- After Honey#1: Clearing throat
            elseif (ToBeeOrNotStatus == 1) then
                player:startEvent(0x0046); -- After Honey#2: Tries to speak again... coughs
            elseif (ToBeeOrNotStatus == 2) then
                player:startEvent(0x0049); -- After Honey#3: Tries to speak again... coughs..asked for more Honey
            elseif (ToBeeOrNotStatus == 3) then
                player:startEvent(0x004A); -- After Honey#4: Feels like its getting a lot better but there is still iritaion
            elseif (ToBeeOrNotStatus == 4) then
                player:startEvent(0x004B); -- After Honey#5: ToBee quest Finish (tooth hurts from all the Honey
            end
        end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local ToBee = player:getQuestStatus(WINDURST,TO_BEE_OR_NOT_TO_BEE);
	local PostmanKOsTwice = player:getQuestStatus(WINDURST,THE_POSTMAN_ALWAYS_KO_S_TWICE);
	local ToBeeOrNotStatus = player:getVar("ToBeeOrNot_var");
	
	if ((player:getFameLevel(WINDURST) >= 2 and PostmanKOsTwice == QUEST_COMPLETED and ToBee == QUEST_AVAILABLE) or (ToBee == QUEST_ACCEPTED and ToBeeOrNotStatus == 10)) then 
		player:startEvent(0x0040);   -- Just Before Quest Start "Too Bee or Not Too Be" (Speech given with lots of coughing)
	elseif (ToBee == QUEST_ACCEPTED) then 
		if (ToBeeOrNotStatus == 1) then
			player:startEvent(0x0045); -- After Honey#1: Clearing throat
		elseif (ToBeeOrNotStatus == 2) then
			player:startEvent(0x0046); -- After Honey#2: Tries to speak again... coughs
		elseif (ToBeeOrNotStatus == 3) then
			player:startEvent(0x0049); -- After Honey#3: Tries to speak again... coughs..asked for more Honey
		elseif (ToBeeOrNotStatus == 4) then
			player:startEvent(0x004A); -- After Honey#4: Feels like its getting a lot better but there is still iritaion
		end
	elseif (ToBee == QUEST_COMPLETED and player:needToZone()) then	
		player:startEvent(0x004E); -- ToBee After Quest Finish but before zone (tooth still hurts)		
	else
		player:startEvent(0x012B); -- Normal speech
	end
end;

--		Event ID List for NPC
--  	player:startEvent(0x012B); -- Normal speach
--  	player:startEvent(0x003D); -- Normal speach
--  	player:startEvent(0x0040); -- Start quest "Too Bee or Not Too Be" (Speech given with lots of coughing)
--  	player:startEvent(0x0045); -- After Honey#1: Clearing throat
--  	player:startEvent(0x0046); -- After Honey#2: Tries to speak again... coughs
--  	player:startEvent(0x0049); -- After Honey#3: Tries to speak again... coughs..asked for more Honey
--  	player:startEvent(0x004A); -- After Honey#4: Feels like its getting a lot better but there is still iritaion
--  	player:startEvent(0x004B); -- After Honey#5: ToBee quest Finish (tooth hurts from all the Honey)
--  	player:startEvent(0x004E); -- ToBee After Quest Finish but before zone (tooth still hurts)

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

	if (csid == 0x0040) then
		player:setVar("ToBeeOrNot_var",10);
	elseif (csid == 0x0045) then -- After Honey#1: Clearing throat
		player:tradeComplete();
		player:setVar("ToBeeOrNot_var",1);
	elseif (csid == 0x0046) then -- After Honey#2: Tries to speak again... coughs
		player:tradeComplete();
		player:setVar("ToBeeOrNot_var",2);
	elseif (csid == 0x0049) then -- After Honey#3: Tries to speak again... coughs..asked for more Honey
		player:tradeComplete();
		player:setVar("ToBeeOrNot_var",3);
	elseif (csid == 0x004A) then -- After Honey#4: Feels like its getting a lot better but there is still iritaion
		player:tradeComplete();
		player:setVar("ToBeeOrNot_var",4);
	elseif (csid == 0x004B) then -- After Honey#5: ToBee quest Finish (tooth hurts from all the Honey)
		player:tradeComplete();
		player:setVar("ToBeeOrNot_var",5);
		player:addFame(WINDURST,WIN_FAME*30);
		player:completeQuest(WINDURST,TO_BEE_OR_NOT_TO_BEE);
		player:needToZone(true);
	end
end;



