-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm16 (???)
-- Notes: CS for Windurst 9-2
-- !pos -239.442 -1.000 -18.870 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and player:getCharVar("MissionStatus") >= 1 then
        player:startEvent(68)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 68 then
        npcUtil.giveKeyItem(player, dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH)
    end
end
