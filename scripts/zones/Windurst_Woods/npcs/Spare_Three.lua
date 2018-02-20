-----------------------------------
-- Area: Windurst Woods
--  NPC: Spare Three
-- Working 100%
--  Involved in quest: A Greeting Cardian
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN);
    local AGCcs = player:getVar("AGreetingCardian_Event");

    if (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 2) then
        player:startEvent(295); -- A Greeting Cardian step two
    else player:startEvent(280); -- standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 295) then
        player:setVar("AGreetingCardian_Event",3);
        end
end;
