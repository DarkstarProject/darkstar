-----------------------------------
-- Area: Heaven's Tower
--  NPC: Starway Stairway
-- !pos -10 0.1 30 242
-----------------------------------
local ID = require("scripts/zones/Heavens_Tower/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getNation() == 2 then
        if player:hasKeyItem(dsp.ki.STARWAY_STAIRWAY_BAUBLE) then
            if player:getXPos() < -14 then
                player:startEvent(106)
            else
                player:startEvent(105)
            end
        else
            player:messageSpecial(ID.text.STAIRWAY_LOCKED)
        end
    else
        player:messageSpecial(ID.text.STAIRWAY_ONLY_CITIZENS)
    end

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end