-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Dimensional_Portal
-- !pos 220.000 19.104 140.000 108
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > dsp.mission.id.cop.THE_WARRIOR_S_PATH) or (DIMENSIONAL_PORTAL_UNLOCK == true) then
        player:startEvent(915);
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE+1); -- Telepoint Disappeared
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 915 and option == 1) then
        player:setPos(-635.599,-2.799,163.8,193,33); -- To AlTaieu {R}
    end
end;