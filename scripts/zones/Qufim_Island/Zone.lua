-----------------------------------
--
-- Zone: Qufim_Island (126)
--
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/conquest")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-286.271, -21.619, 320.084, 255)
    end

    if prevZone == dsp.zone.BEHEMOTHS_DOMINION and player:getCharVar("theTalekeepersGiftKilledNM") >= 3 then
        cs = 100
    end

    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 100 then
        npcUtil.completeQuest(player, BASTOK, dsp.quest.id.bastok.THE_TALEKEEPER_S_GIFT, {item = 12638, fame = 60, title = dsp.title.PARAGON_OF_WARRIOR_EXCELLENCE, var = {"theTalekeeperGiftCS", "theTalekeepersGiftKilledNM"}})
    end
end
