-----------------------------------
-- Area: Hall of Transference
--  NPC: Cermet Gate - Mea
-- !pos 280 -86 -19
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Hall_of_Transference/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > dsp.mission.id.cop.BELOW_THE_ARKS) then
        player:startEvent(150);
    else
        player:messageSpecial(ID.text.NO_RESPONSE_OFFSET+1); -- The door is firmly shut.
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 150 and option == 1) then
        player:setPos(-93.268, 0, 170.749, 162, 20); -- To Promyvion Mea {R}
    end
end;