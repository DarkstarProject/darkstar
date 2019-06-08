-----------------------------------
-- Area: Sea Serpent Grotto (176)
--  NPC: Waterfall Basin
-- !pos 105 0.48 -114
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(AMK) == dsp.mission.id.amk.LENDER_BEWARE_READ_THE_FINE_PRINT and player:getVar("AMK") == 1 then
        player:startEvent(20)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 20 then
        player:setVar("AMK", 2)
    end
end
