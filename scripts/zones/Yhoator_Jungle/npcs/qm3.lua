-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (qm3)
-- Involved in Quest: True will
-- !pos 203 0.1 82 124
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRUE_WILL) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.OLD_TRICK_BOX) then
        if player:getVar("trueWillKilledNM") > 0 then
            player:addKeyItem(dsp.ki.OLD_TRICK_BOX)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.OLD_TRICK_BOX)
            player:setVar("trueWillKilledNM", 0)
        else
            SpawnMob(ID.mob.KAPPA_AKUSO):updateClaim(player)
            SpawnMob(ID.mob.KAPPA_BONZE):updateClaim(player)
            SpawnMob(ID.mob.KAPPA_BIWA):updateClaim(player)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
