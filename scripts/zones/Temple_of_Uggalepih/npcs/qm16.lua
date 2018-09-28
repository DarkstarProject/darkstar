-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm16 (???)
-- Notes: CS for Windurst 9-2
-- !pos -239.442 -1.000 -18.870 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local CurrentMission = player:getCurrentMission(WINDURST)
    local MissionStatus = player:getVar("MissionStatus")

    if CurrentMission == MOON_READING and MissionStatus >= 1 then
        player:startEvent(68)
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 68 then
        player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH)
    end
end
