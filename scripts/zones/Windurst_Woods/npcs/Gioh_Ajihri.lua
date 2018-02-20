-----------------------------------
-- Area: Windurst Woods
--  NPC: Gioh Ajihri
-- Starts & Finishes Repeatable Quest: Twinstone Bonding
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

GiohAijhriSpokenTo = player:getVar("GiohAijhriSpokenTo");
NeedToZone = player:needToZone();

    if (GiohAijhriSpokenTo == 1 and NeedToZone == false) then
        count = trade:getItemCount();
        TwinstoneEarring = trade:hasItemQty(13360,1);

        if (TwinstoneEarring == true and count == 1) then
            player:startEvent(490);
        end
    end

end;

function onTrigger(player,npc)

TwinstoneBonding = player:getQuestStatus(WINDURST,TWINSTONE_BONDING);
Fame = player:getFameLevel(WINDURST);

    if (TwinstoneBonding == QUEST_COMPLETED) then
        if (player:needToZone()) then
            player:startEvent(491,0,13360);
        else
            player:startEvent(488,0,13360);
        end
    elseif (TwinstoneBonding == QUEST_ACCEPTED) then
        player:startEvent(488,0,13360);
    elseif (TwinstoneBonding == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(487,0,13360);
    else
        player:startEvent(424);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 487) then
        player:addQuest(WINDURST,TWINSTONE_BONDING);
        player:setVar("GiohAijhriSpokenTo",1);
    elseif (csid == 490) then
        TwinstoneBonding = player:getQuestStatus(WINDURST,TWINSTONE_BONDING);
        player:tradeComplete();
        player:needToZone(true);
        player:setVar("GiohAijhriSpokenTo",0);

        if (TwinstoneBonding == QUEST_ACCEPTED) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17154);
            else
                player:completeQuest(WINDURST,TWINSTONE_BONDING);
                player:addFame(WINDURST,80);
                player:addItem(17154);
                player:messageSpecial(ITEM_OBTAINED,17154);
                player:addTitle(BOND_FIXER);
            end
        else
            player:addFame(WINDURST,10);
            player:addGil(GIL_RATE*900);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
        end
    elseif (csid == 488) then
        player:setVar("GiohAijhriSpokenTo",1);
    end

end;




