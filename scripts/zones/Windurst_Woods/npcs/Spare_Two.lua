-----------------------------------
--    Area: Windurst Woods
--    NPC:  Spare Two
--    Working 100%
--  Involved in quest: A Greeting Cardian
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN);
    local AGCcs = player:getVar("AGreetingCardian_Event");
    
    if (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 2) then
        player:startEvent(0x0127); -- A Greeting Cardian step two
    else player:startEvent(0x117); -- standard dialog
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
    if (csid == 0x0127) then
        player:setVar("AGreetingCardian_Event",3);
        end
end;



