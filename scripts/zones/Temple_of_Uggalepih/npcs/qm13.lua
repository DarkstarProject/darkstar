-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (San dOria Mission 8-2)
-- !pos -68 -17 -153 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 4 then
        player:setVar("MissionStatus", 5)
        player:addKeyItem(dsp.ki.PIECE_OF_A_BROKEN_KEY3)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PIECE_OF_A_BROKEN_KEY3)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end