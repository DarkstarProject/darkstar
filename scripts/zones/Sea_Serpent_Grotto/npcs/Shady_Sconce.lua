-----------------------------------
-- Area: Sea Serpent Grotto (176)
--  NPC: Shady Sconce
-- !pos -179 25 273
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(AMK) == dsp.mission.id.amk.LENDER_BEWARE_READ_THE_FINE_PRINT and player:getVar("AMK") == 0 then
        player:startEvent(19)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 19 and option == 1 then
        player:setVar("AMK", 1)
    end
end