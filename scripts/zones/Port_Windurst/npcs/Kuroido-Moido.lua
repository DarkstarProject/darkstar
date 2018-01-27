-----------------------------------
-- Area: Port Windurst
--  NPC: Kuriodo-Moido
-- Involved In Quest: Making Amends, Wonder Wands
--  Starts and Finishes: Making Amens!
--    Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS); --First quest in series
    MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS); --Second quest in series
    WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
    pfame = player:getFameLevel(WINDURST);
    needToZone = player:needToZone();
    BrokenWand = player:hasKeyItem(128);

    if (MakingAmends == QUEST_ACCEPTED) then -- MAKING AMENDS: During Quest
        player:startEvent(276);
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens ~= QUEST_COMPLETED and WonderWands ~= QUEST_COMPLETED and needToZone) then -- MAKING AMENDS: After Quest
        player:startEvent(279);
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens == QUEST_AVAILABLE) then
        if (pfame >=4 and not needToZone) then
            player:startEvent(280); -- Start Making Amens! if prerequisites are met
        else
            player:startEvent(279); -- MAKING AMENDS: After Quest
        end
    elseif (MakingAmens == QUEST_ACCEPTED and not BrokenWand) then -- Reminder for Making Amens!
        player:startEvent(283);
    elseif (MakingAmens == QUEST_ACCEPTED and BrokenWand) then -- Complete Making Amens!
        player:startEvent(284,GIL_RATE*6000);
    elseif (MakingAmens == QUEST_COMPLETED) then
        if (WonderWands == QUEST_ACCEPTED) then -- During Wonder Wands dialogue
            player:startEvent(261);
        elseif (WonderWands == QUEST_COMPLETED) then -- Post Wonder Wands dialogue
            player:startEvent(266);
        else
            player:startEvent(286,0,937); -- Post Making Amens! dialogue (before Wonder Wands)
        end
    elseif (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD) then
        local item = 0;
        local asaStatus = player:getVar("ASA_Status");

        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
        end

        -- The Parameters are Item IDs for the Recipe
        player:startEvent(858, item, 1134, 2778, 2778, 4099, 2778);
    else
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(225);   -- Standard Conversation
        else
            player:startEvent(226);   -- Standard Conversation
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 280) then
        player:addQuest(WINDURST,MAKING_AMENS);
    elseif (csid == 284) then
        player:needToZone(true);
        player:delKeyItem(BROKEN_WAND);
        player:addTitle(HAKKURURINKURUS_BENEFACTOR);
        player:addGil(GIL_RATE*6000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*6000);
        player:addFame(WINDURST,150);
        player:completeQuest(WINDURST,MAKING_AMENS);
    end
end;



