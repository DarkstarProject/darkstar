-----------------------------------
-- Area: Windurst Waters
--  NPC: Yung Yaam
--    Involved In Quest: Wondering Minstrel
--    Working 100%
--  @zone = 238
--  @pos = -63 -4 27
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");    
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--player:addFame(WINDURST,100)
    wonderingstatus = player:getQuestStatus(WINDURST,WONDERING_MINSTREL);
    fame = player:getFameLevel(WINDURST)
    if (wonderingstatus <= 1 and fame >= 5) then 
        player:startEvent(0x027d);                        -- WONDERING_MINSTREL: Quest Available / Quest Accepted
    elseif (wonderingstatus == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x0283);                      -- WONDERING_MINSTREL: Quest After
    else
        player:startEvent(0x0261);                      -- Standard Conversation
    end
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
end;



