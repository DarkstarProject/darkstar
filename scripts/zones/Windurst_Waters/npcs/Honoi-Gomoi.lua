-----------------------------------
-- Area: Windurst Waters
-- NPC: Honoi-Gumoi
-- Involved In Quest: Crying Over Onions, Hat in Hand
--  @zone = 238
--  @pos = -195 -11 -120
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    CryingOverOnionsVar = player:getVar("CryingOverOnions");
        if (CryingOverOnions == 1) then
        count = trade:getItemCount();
        StarSpinel = trade:hasItemQty(1149,1);
        if (StarSpinel == true and count == 1) then
            player:startEvent(0x0307,0,1149);
        end    
    end    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    CryingOverOnions = player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);
    WildCard   = player:getQuestStatus(WINDURST,WILD_CARD);
    NeedToZone = player:needToZone();
    Fame       = player:getFameLevel(WINDURST);
    hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==5) then
        player:startEvent(0x036A);  --COP event
    elseif ((hatstatus == 1 or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),2) == false) then
        player:startEvent(0x003b); -- Show Off Hat
    elseif (WildCard == QUEST_COMPLETED) then
        player:startEvent(0x030f);
    elseif (WildCard == QUEST_ACCEPTED) then
        WildCardVar = player:getVar("WildCard");
        JokerCard   = player:hasKeyItem(264);
        if (WildCardVar == 3 and JokerCard == false) then
            player:startEvent(0x030e);
        else
            player:startEvent(0x030d);
        end
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        if (NeedToZone == false and Fame >= 6) then
            player:startEvent(0x030c);
        else
            player:startEvent(0x030b);
        end
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        CryingOverOnionsVar = player:getVar("CryingOverOnions");
        if (CryingOverOnionsVar == 3) then
            player:startEvent(0x0308);
        elseif (CryingOverOnionsVar == 2) then
            player:startEvent(0x030a);
        elseif (CryingOverOnionsVar == 1) then
            player:startEvent(0x0309);
        else
            player:startEvent(0x0306,0,1149);
        end
    else
        player:startEvent(0x028a);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0306) then
        player:setVar("CryingOverOnions",1);
    elseif (csid == 0x0307) then
        player:tradeComplete();
        player:setVar("CryingOverOnions",2);
        player:addItem(13136);
        player:messageSpecial(ITEM_OBTAINED,13136);
    elseif (csid == 0x0308) then
        player:completeQuest(WINDURST,CRYING_OVER_ONIONS);
        player:addFame(WINDURST,120);
        player:setVar("CryingOverOnions",0);
        player:needToZone(true);
    elseif (csid == 0x030c) then
        player:addQuest(WINDURST,WILD_CARD);
    elseif (csid == 0x030e) then
        player:completeQuest(WINDURST,WILD_CARD);
        player:addFame(WINDURST,135);
        player:addTitle(DREAM_DWELLER);
        player:setVar("WildCard",0);
        player:needToZone(true);
    elseif (csid == 0x003b) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+2);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    elseif (csid == 0x036A)    then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",6);
        player:addKeyItem(CRACKED_MIMEO_MIRROR); --Cracked Mimeo Mirror
        player:messageSpecial(KEYITEM_OBTAINED,CRACKED_MIMEO_MIRROR);
    end
end;




