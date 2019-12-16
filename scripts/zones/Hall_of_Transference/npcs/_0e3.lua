-----------------------------------
-- Area: Hall of Transference
--  NPC: Large Apparatus (Left) - Holla
-- !pos -239 -1 290 14
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Hall_of_Transference/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") == 1) then
        player:startEvent(160);
    else
        player:messageSpecial(ID.text.NO_RESPONSE_OFFSET);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 160) then
        player:setPos(92.033, 0, 80.380, 255, 16); -- To Promyvion Holla {R}
    end
end;