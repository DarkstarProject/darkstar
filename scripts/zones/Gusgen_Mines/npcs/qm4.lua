-----------------------------------
-- Area: Gusgen Mines
--  NPC: qm4 (???)
-- Involved In Quest: Ghosts of the Past
-- !pos -174 0 369 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gusgen_Mines/TextIDs");
require("scripts/zones/Gusgen_Mines/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- GHOSTS OF THE PAST: Pickaxe
    if (
        player:getQuestStatus(BASTOK, GHOSTS_OF_THE_PAST) == QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, 605) and
        not player:hasItem(13122) and
        not GetMobByID(WANDERING_GHOST):isSpawned()
    ) then
        player:confirmTrade();
        SpawnMob(WANDERING_GHOST):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
