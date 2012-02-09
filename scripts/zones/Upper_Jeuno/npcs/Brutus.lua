-----------------------------------
-- Area: Upper Jeuno
-- NPC: Brutus
-- Starts Quest: Chocobo's Wounds, Save My Son, Path of the Beastmaster
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);
	saveMySon = player:getQuestStatus(JEUNO,SAVE_MY_SON);

	if(player:getMainLvl() >= 20 and ChocobosWounds ~= QUEST_COMPLETED) then
        chocoFeed = player:getVar("ChocobosWounds_Event");

       	if(ChocobosWounds == QUEST_AVAILABLE) then
            player:startEvent(0x0047);
        elseif(chocoFeed == 1) then
        	player:startEvent(0x0041);
        elseif(chocoFeed == 2) then
        	player:startEvent(0x0042);
        else
            player:startEvent(0x0066);
        end
    elseif(ChocobosWounds == QUEST_COMPLETED and saveMySon == QUEST_AVAILABLE) then
		player:startEvent(0x0016);
    elseif(saveMySon == QUEST_COMPLETED and player:getQuestStatus(JEUNO,PATH_OF_THE_BEASTMASTER) == QUEST_AVAILABLE) then
    	player:startEvent(0x0046);
	else 
		player:startEvent(0x0014);
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

    if(csid == 0x0047 and option == 1) then
        player:addQuest(JEUNO,CHOCOBO_S_WOUNDS);
    	player:setVar("ChocobosWounds_Event",1);
    elseif(csid == 0x0046) then
    	player:addQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
		player:setTitle(ANIMAL_TRAINER);
		player:unlockJob(9); -- Beastmaster
		player:messageSpecial(YOU_CAN_NOW_BECOME_A_BEASTMASTER);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
    end
	
end;