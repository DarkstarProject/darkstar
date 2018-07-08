-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
-- !pos 125 -2 216 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Windurst_Waters_[S]/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local tigressStirs = player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)
    local tigressStrikes = player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES)
    local knotQuiteThere = player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE)

    if (tigressStirs==QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SMALL_STARFRUIT)) then
        player:startEvent(129);
    elseif (tigressStrikes == QUEST_COMPLETED and knotQuiteThere == QUEST_AVAILABLE) then
        if (player:getCurrentMission(WOTG) == CAIT_SITH or player:hasCompletedMission(WOTG, CAIT_SITH)) then
            player:startEvent(151);
        end
    elseif (knotQuiteThere == QUEST_ACCEPTED) then
        player:startEvent(152);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if csid == 129 and npcUtil.completeQuest(player, CRYSTAL_WAR, THE_TIGRESS_STIRS, {item=4144, keyItem=dsp.ki.BRASS_RIBBON_OF_SERVICE}) then
        player:delKeyItem(dsp.ki.SMALL_STARFRUIT);
    elseif (csid == 151) then
        player:addQuest(CRYSTAL_WAR, KNOT_QUITE_THERE);
    end
end;

