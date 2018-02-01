-----------------------------------
-- Area: Vunkerl Inlet (S) (F-5)
--  NPC: Leafy Patch
-- Involved in Quests
-- !pos -418 -33 576
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getVar("BoyAndTheBeast") == 2) then
        if (VanadielHour() < 8) then
            player:startEvent(107);
        elseif (VanadielHour() < 16) then
            player:startEvent(107,1);
        else
            player:startEvent(107,2);
        end
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 107) then
        if (option == 1) then
            player:addKeyItem(VUNKERL_HERB);
            player:messageSpecial(KEYITEM_OBTAINED, VUNKERL_HERB);
            player:setVar("BoyAndTheBeast",3);
        else
            player:addKeyItem(VUNKERL_HERB);
            player:messageSpecial(KEYITEM_OBTAINED, VUNKERL_HERB);
            player:setVar("BoyAndTheBeast",4);
        end
    end
end;
