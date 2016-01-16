-----------------------------------
-- Area: Port Jeuno
-- NPC: Joachim
-- @zone 246
-- @pos -52.844 0.000 -9.978
-- CS/Event ID's:
-- 0x0144 = on zoning in
-- 0x0145 = 1st chat, get 1st stone,
-- completes "A Journey Begins"
-- 0x0146 = Limited Menu
-- 0x0147 = CS after "The Truth Beckons" completed.
-- 0x0148 = Full Menu
-- 0x014B = CS after "Dawn of Death" completed.
-- 0x014C =
-- 0x014D =
-- 0x014E =
-- 0x014F =
-- 0x0150 =
-- 0x0151 =
-- 0x0152 =
-- 0x0153 =
-- 0x0154 =
-- 0x0155 =
-- 0x0156 =
-- 0x0157 =
-- 0x0158 =
-- 0x0159 =
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/abyssea");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- TODO: logic to increase traverser stone count...Based on time between 2 vars?
    local StonesStock = player:getCurrency("traverser_stones");
    local StonesKI = getTravStonesTotal(player);
    local MaxKI = getMaxTravStones(player);
    local isCap = 0;
    if (StonesKI >= MaxKI) then
        isCap = 1;
    end

    if (player:getQuestStatus(ABYSSEA, A_JOURNEY_BEGINS) == QUEST_ACCEPTED) then
        player:startEvent(0x0145);
    elseif (player:getQuestStatus(ABYSSEA, THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getVar("1stTimeAyssea") == 1) then
        player:startEvent(0x0147,0,0,MaxKI); -- cs for "The Truth Beckons" completion
    elseif (player:getQuestStatus(ABYSSEA, THE_TRUTH_BECKONS) ~= QUEST_COMPLETED) then
        player:startEvent(0x0146); -- Pre "The Truth Beckons" Menu
    elseif (player:getQuestStatus(ABYSSEA, DAWN_OF_DEATH) == QUEST_ACCEPTED) then
        player:startEvent(0x0148,0,StonesStock,StonesKI,isCap,1,1,1,3); -- Post "The Truth Beckons" Menu
    -- elseif
        -- player:startEvent(0x014C);
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
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
    if (csid == 0x0145) then
        player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE1);
        player:addKeyItem(TRAVERSER_STONE1)
        player:completeQuest(ABYSSEA, A_JOURNEY_BEGINS);
        player:addQuest(ABYSSEA, THE_TRUTH_BECKONS);
    elseif (csid == 0x0147) then
        player:completeQuest(ABYSSEA, THE_TRUTH_BECKONS);
        player:addQuest(ABYSSEA, DAWN_OF_DEATH);
        player:setVar("1stTimeAyssea",0);
    elseif (csid == 0x0148 and option == 6) then
        local StonesKI = getTravStonesTotal(player);
        if (StonesKI == 5) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE6);
            player:addKeyItem(TRAVERSER_STONE6)
        elseif (StonesKI == 4) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE5);
            player:addKeyItem(TRAVERSER_STONE5)
        elseif (StonesKI == 3) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE4)
            player:addKeyItem(TRAVERSER_STONE4);
        elseif (StonesKI == 2) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE3);
            player:addKeyItem(TRAVERSER_STONE3)
        elseif (StonesKI == 1) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE2);
            player:addKeyItem(TRAVERSER_STONE2)
        elseif (StonesKI == 0) then
            player:messageSpecial(KEYITEM_OBTAINED,TRAVERSER_STONE1);
            player:addKeyItem(TRAVERSER_STONE1)
        end
    end
end;