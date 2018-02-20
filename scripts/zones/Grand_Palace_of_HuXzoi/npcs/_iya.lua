-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Gate of the Gods
-- !pos -20 0.1 -283 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(1);
    else
        player:startEvent(52);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 52 and option == 1) then
        player:setPos(-419.995,0,248.483,191,35); -- To The Garden of RuHmet {R}
    elseif (csid == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14672);
        else
            if (player:addItem(14672)) then
                player:setVar("PromathiaStatus",0);
                player:completeMission(COP, GARDEN_OF_ANTIQUITY);
                player:addMission(COP, A_FATE_DECIDED);
                player:messageSpecial(ITEM_OBTAINED, 14672);
            end
        end
    end

end;
