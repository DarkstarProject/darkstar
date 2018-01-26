-----------------------------------
-- Area: Vunkerl Inlet (S) (I-6)
--  NPC: Leadavox
-- Involved in Quests
-- !pos 206 -32 316
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_ACCEPTED and player:getVar("BetterPartOfValProg") == 3) then
        if (trade:hasItemQty(2521,1) and trade:getItemCount() == 1 and trade:getGil() == 0) then
            player:startEvent(103);
        end
    end
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_ACCEPTED) then
        if (player:getVar("BetterPartOfValProg") == 2) then
            player:startEvent(101);
        elseif (player:getVar("BetterPartOfValProg") == 3) then
            player:startEvent(102);
        end
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 101) then
        player:setVar("BetterPartOfValProg",3);
    elseif (csid == 103) then
        player:tradeComplete();
        player:setVar("BetterPartOfValProg",4)
        player:addKeyItem(XHIFHUT);
        player:messageSpecial(KEYITEM_OBTAINED,XHIFHUT);
    end
end;
