-----------------------------------
-- Area: Gusgen Mines
--  NPC: qm2 (???)
-- Involved In Mission: Bastok 3-2
-- !pos 206 -60 -101 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gusgen_Mines/TextIDs");
require("scripts/zones/Gusgen_Mines/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    -- TO THE FORSAKEN MINES: Hare Meat
    if (
        player:getCurrentMission(BASTOK) == TO_THE_FORSAKEN_MINES and
        npcUtil.tradeHas(trade, 4358) and
        not player:hasItem(563) and
        not GetMobByID(BLIND_MOBY):isSpawned()
    ) then
        player:confirmTrade();
        SpawnMob(BLIND_MOBY):updateClaim(player);

    -- BLADE OF DEATH: Chaosbringer
    elseif (
        player:getQuestStatus(BASTOK, BLADE_OF_DEATH) == QUEST_ACCEPTED and
        player:getVar("ChaosbringerKills") >= 200 and
        npcUtil.tradeHas(trade, 16607)
    ) then
        player:startEvent(10);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10 and npcUtil.completeQuest(player, BASTOK, BLADE_OF_DEATH, {item=16637, title=dsp.title.BLACK_DEATH, var="ChaosbringerKills"})) then
        player:confirmTrade();
        player:delKeyItem(dsp.ki.LETTER_FROM_ZEID);
    end
end;
