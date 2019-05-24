-----------------------------------
-- Area: Caedarva Mire
--  NPC: ???
-- Involved in quest "Not Meant to Be"
-- !pos 456.993 -7.000 -270.815 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local notMeantToBeProg = player:getVar("notmeanttobeCS")
    
    if notMeantToBeProg == 1 then
        player:startEvent(16)
    elseif
        player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.NOT_MEANT_TO_BE) == QUEST_ACCEPTED and
        notMeantToBeProg == 3 and
        not GetMobByID(ID.mob.LAMIA_NO27):isSpawned() and
        not GetMobByID(ID.mob.MOSHDAHN):isSpawned()
    then
        player:startEvent(17)
    elseif player:getVar("notmeanttobeMoshdahnKilled") == 1 and player:getVar("notmeanttobeLamia27Killed") == 1 then
        player:startEvent(18)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 16 then
        player:setVar("notmeanttobeCS", 2)
    elseif csid == 17 and not GetMobByID(ID.mob.LAMIA_NO27):isSpawned() and not GetMobByID(ID.mob.MOSHDAHN):isSpawned() then
        SpawnMob(ID.mob.LAMIA_NO27):updateClaim(player)
        SpawnMob(ID.mob.MOSHDAHN):updateClaim(player)
    elseif csid == 18 then
        player:setVar("notmeanttobeMoshdahnKilled", 0)
        player:setVar("notmeanttobeLamia27Killed", 0)
        player:setVar("notmeanttobeCS", 5)
    end
end