-----------------------------------
--
-- Zone: Aydeewa_Subterrane (68)
--
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,378,-3,338,382,3,342)
end

function onZoneIn(player,prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(356.503,-0.364,-179.607,122)
    end

    if player:getCurrentMission(TOAU) == dsp.mission.id.toau.TEAHOUSE_TUMULT and player:getVar("AhtUrganStatus") == 0 then
        cs = 10
    end

    return cs
end

function onRegionEnter(player,region)
    if region:GetRegionID() == 1 then
        local StoneID = player:getVar("EmptyVesselStone")
        if player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.AN_EMPTY_VESSEL) == QUEST_ACCEPTED and player:getVar("AnEmptyVesselProgress") == 4 and player:hasItem(StoneID) then
            player:startEvent(3,StoneID)
        end
    end
end

function onRegionLeave(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if
        csid == 3 and
        option == 13 and
        npcUtil.completeQuest(player, AHT_URHGAN, dsp.quest.id.ahtUrhgan.AN_EMPTY_VESSEL, {title=dsp.title.BEARER_OF_THE_MARK_OF_ZAHAK, ki=dsp.ki.MARK_OF_ZAHAK, var={"AnEmptyVesselProgress", "EmptyVesselStone"}})
    then -- Accept and unlock
        player:unlockJob(dsp.job.BLU)
        player:setPos(148,-2,0,130,50)
    elseif csid == 3 and option ~= 13 then -- Make a mistake and get reset
        player:setVar("AnEmptyVesselProgress", 0)
        player:setVar("EmptyVesselStone", 0)
        player:delQuest(AHT_URHGAN,dsp.quest.id.ahtUrhgan.AN_EMPTY_VESSEL)
        player:setPos(148,-2,0,130,50)
    elseif csid == 10 then
        player:setVar("AhtUrganStatus", 1)
    end
end