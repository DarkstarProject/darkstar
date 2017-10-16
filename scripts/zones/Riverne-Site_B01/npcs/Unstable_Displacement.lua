-----------------------------------
-- Area: Riverne Site #B01
-- NPC:  Unstable Displacement
-- ENM Battlefield
-- !pos -612 4 693
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/bcnm");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 1) then
        player:startEvent(0x0001);
    elseif (EventTriggerBCNM(player,npc)) then
        return 1;
    else
        player:messageSpecial(SPACE_SEEMS_DISTORTED);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0001) then
        player:setVar('StormsOfFate',2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;