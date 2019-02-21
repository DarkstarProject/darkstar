-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: qm4
-- Note: Involved in quest "The Tigress Stirs"
-- !pos 150 -39 331 95
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STIRS) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.SMALL_STARFRUIT) then
        player:addKeyItem(dsp.ki.SMALL_STARFRUIT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SMALL_STARFRUIT)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
