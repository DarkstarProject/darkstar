-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Gate of the Gods
-- !pos -20 0.1 -283 34
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 3) then
        player:startEvent(1);
    else
        player:startEvent(52);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 52 and option == 1) then
        player:setPos(-419.995,0,248.483,191,35); -- To The Garden of RuHmet {R}
    elseif (csid == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14672);
        else
            if (player:addItem(14672)) then
                player:setCharVar("PromathiaStatus",0);
                player:completeMission(COP, dsp.mission.id.cop.GARDEN_OF_ANTIQUITY);
                player:addMission(COP, dsp.mission.id.cop.A_FATE_DECIDED);
                player:messageSpecial(ID.text.ITEM_OBTAINED, 14672);
            end
        end
    end

end;
