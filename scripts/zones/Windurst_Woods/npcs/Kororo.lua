-----------------------------------
-- Area: Windurst Woods
--  NPC: Kororo
--  Type: Standard NPC
--  @zone: 241
--  @pos -11.883 -3.75 5.508
--  Starts quest: A Greeting Cardian 
-- Involved in quests: Lost Chick
--  Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local C2000 = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000); --     previous quest in line
local AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN);
local LPB = player:getQuestStatus(WINDURST,LEGENDARY_PLAN_B);
local AGCcs = player:getVar("AGreetingCardian_Event");
local AGCtime = player:getVar("AGreetingCardian_timer");
    
    -- A Greeting Cardian 
    if (C2000 == QUEST_COMPLETED and AGreetingCardian == QUEST_AVAILABLE and player:getFameLevel (WINDURST) >= 3) then
        player:startEvent(0x0128); -- A Greeting Cardian quest start
    elseif (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 3) then
        if (player:needToZone() or tonumber(os.date("%j")) == AGCtime) then
        player:startEvent(0x0115); --standard dialog if JP midnight has not passed
        else
        player:startEvent(0x012a); -- A Greeting Cardian part two
        end
    elseif (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 5) then
        player:startEvent(0x012f); -- A Greeting Cardian finish
    
    -- Might be Legendary Plan B, most likely Lost Chick related. 
    -- only activates before LPB completes so leaving it in as is for now
    elseif (LPB == QUEST_ACCEPTED) then
        player:startEvent(0x0138,0,529,940,858); 
    
    else
        player:startEvent(0x0115); --standard dialog
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
    
    -- A Greeting Cardian
    if (csid == 0x0128) then
        player:addQuest(WINDURST,A_GREETING_CARDIAN);
        player:setVar("AGreetingCardian_Event",2);
        player:setVar("AGreetingCardian_timer", os.date("%j")); 
        player:needToZone(true); -- wait one day and zone after next step
    elseif (csid == 0x012a) then
        player:setVar("AGreetingCardian_Event",4);
    elseif (csid == 0x012f) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13330); -- Tourmaline Earring
        else
            player:addItem(13330);
            player:messageSpecial(ITEM_OBTAINED, 13330); -- Tourmaline Earring
            player:addFame(WINDURST,30);
            player:completeQuest(WINDURST,A_GREETING_CARDIAN);
            player:needToZone(true); -- zone before starting Legendary Plan B
            player:setVar("AGreetingCardian_timer",0);
            player:setVar("AGreetingCardian_Event",0); -- finish cleanup of A Greeting Cardian variables
        end
    end
end;

