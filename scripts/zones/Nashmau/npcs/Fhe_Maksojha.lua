-----------------------------------
--  Area: Nashmau
--  NPC:  Fhe Maksojha
--  Type: Standard NPC
--  @pos 19.084 -7 71.287 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");

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
    local notmeanttobe = player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE);
    local notMeantToBeProg = player:getVar("notmeanttobeCS");
    if (notmeanttobe == QUEST_AVAILABLE) then
        player:startEvent(0x0125);
    elseif (notMeantToBeProg == 1) then
        player:startEvent(0x0127);
    elseif (notMeantToBeProg == 2) then
        player:startEvent(0x0126);
    elseif (notMeantToBeProg == 3) then
        player:startEvent(0x0128);
    elseif (notMeantToBeProg == 5) then
        player:startEvent(0x0129);
    elseif (notmeanttobe == QUEST_COMPLETED) then
        player:startEvent(0x012a);
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
    if (csid == 0x0125) then
       player:setVar("notmeanttobeCS",1);
       player:addQuest(AHT_URHGAN,NOT_MEANT_TO_BE);
    elseif (csid == 0x0126) then
       player:setVar("notmeanttobeCS",3);
    elseif (csid == 0x0129) then
        if (player:getFreeSlotsCount() == 0) then
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINEDX,2187,3);
        else
           player:setVar("notmeanttobeCS",0);
           player:addItem(2187,3);
           player:messageSpecial(ITEM_OBTAINEDX,2187,3);
           player:completeQuest(AHT_URHGAN,NOT_MEANT_TO_BE);
        end
    end
end;

