-----------------------------------
-- Area: Castle Zvahl Keep
--  NPC: Ore door
-- Involved In Quest: Recollections
-- !pos -14 0 69 162
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Keep/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Castle_Zvahl_Keep/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(WINDURST,RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") == 2) then
        if (trade:hasItemQty(1106,1) and trade:getItemCount() == 1) then
            player:startEvent(8,1106);
        end
    end

end;

function onTrigger(player,npc)
    player:startEvent(9);
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8) then
        player:tradeComplete();
        player:setVar("recollectionsQuest",3);
        player:addKeyItem(FOE_FINDER_MK_I);
        player:messageSpecial(KEYITEM_OBTAINED,FOE_FINDER_MK_I);
    end

end;