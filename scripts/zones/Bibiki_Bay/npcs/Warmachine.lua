-----------------------------------
-- Area: Bibiki Bay
--  NPC: Warmachine
-- !pos -345.236 -3.188 -976.563 4
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Bibiki_Bay/IDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

local ColoredDrop = 4258+math.random(0,7);

    -- COP mission
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 2) then
        player:startEvent(33);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getVar("COP_3-taru_story")== 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,ColoredDrop);
        else
            player:setVar("ColoredDrop",ColoredDrop);
            player:startEvent(43);
        end
    -- standard dialog
    else

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 33) then
        player:setVar("COP_Louverance_s_Path",3);
    elseif (csid == 43) then
        local ColoredDropID=player:getVar("ColoredDrop");
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,ColoredDropID);
        else
            player:addItem(ColoredDropID);
            player:messageSpecial(ID.text.ITEM_OBTAINED,ColoredDropID);
            player:setVar("COP_3-taru_story",2);
            player:setVar("ColoredDrop",0);
        end
    end

end;
