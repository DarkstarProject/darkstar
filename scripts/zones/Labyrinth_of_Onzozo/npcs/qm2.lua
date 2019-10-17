-----------------------------------
-- Area: Labyrinth of Onzozo
--  NPC: ??? (qm2)
-- Involved in Quest: Yomi Okuri
-- !pos -176 10 -60 213
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:hasKeyItem(dsp.ki.WASHUS_TASTY_WURST) and not GetMobByID(ID.mob.UBUME):isSpawned() then
        player:startEvent(0)
    elseif player:getCharVar("yomiOkuriKilledNM") == 1 and not player:hasKeyItem(dsp.ki.YOMOTSU_FEATHER) then
        player:startEvent(1)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 0 and option == 1 then
        player:delKeyItem(dsp.ki.WASHUS_TASTY_WURST)
        SpawnMob(ID.mob.UBUME):updateClaim(player)
    elseif csid == 1 then
        player:addKeyItem(dsp.ki.YOMOTSU_FEATHER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.YOMOTSU_FEATHER)
    end
end
