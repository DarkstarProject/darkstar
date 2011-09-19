-----------------------------------
-- Area: Upper Jeuno
-- NPC: Brutus
-- Starts Quest: Chocobo's Wounds
-----------------------------------

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

    if (player:getMailLvl() >= 20 and ChocobosWounds ~= 2) then
        if (ChocobosWounds == 0) then
            player:startEvent(0x0047);
        else
            player:startEvent(0x0066);
        end
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

    if (csid == 0x0047 and option == 1) then
        player:addQuest(JEUNO,CHOCOBO_S_WOUNDS);
    	player:setVar("ChocobosWounds_Event",1);
    end
end;
