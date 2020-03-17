-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (San dOria Mission 8-2)
-- !pos -32 -17 -153 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(SANDORIA) == tpz.mission.id.sandoria.LIGHTBRINGER and player:getCharVar("MissionStatus") == 3 then
        player:setCharVar("MissionStatus", 4)
        player:addKeyItem(tpz.ki.PIECE_OF_A_BROKEN_KEY2)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.PIECE_OF_A_BROKEN_KEY2)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end