-----------------------------------
--
-- Zone: Abyssea - Grauberg
--
-----------------------------------
local ID = require("scripts/zones/Abyssea-Grauberg/IDs")
require("scripts/globals/quests")
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
end

function onZoneIn(player,prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-555,31,-760,0)
    end

    if player:getQuestStatus(ABYSSEA, dsp.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getVar("1stTimeAbyssea") == 0 then
        player:setVar("1stTimeAbyssea",1)
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end