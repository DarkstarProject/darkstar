-----------------------------------
--
-- Zone: Abyssea - Altepa
--
-----------------------------------
local ID = require("scripts/zones/Abyssea-Altepa/IDs")
require("scripts/globals/quests")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(435 ,0 ,320 ,136)
    end

    if player:getQuestStatus(ABYSSEA, dsp.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getCharVar("1stTimeAbyssea") == 0 then
        player:setCharVar("1stTimeAbyssea",1)
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end