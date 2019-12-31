-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ???
-- Involved in Mission: Bastok 8-2
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.ENTER_THE_TALEKEEPER and player:getCharVar("MissionStatus") == 1 then
        player:startEvent(12)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 12 and option == 0 then
        player:setCharVar("MissionStatus", 2)
        player:messageSpecial(ID.text.FELL)
    end
end
