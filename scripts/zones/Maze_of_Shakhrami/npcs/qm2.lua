-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: qm2
-- Type: Quest NPC
-- !pos 143 9 -219 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/zones/Maze_of_Shakhrami/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(WINDURST,ECO_WARRIOR_WIN) ~= QUEST_AVAILABLE and
        player:getVar("ECO_WARRIOR_ACTIVE") == 238 and
        player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION) and
        not player:hasKeyItem(INDIGESTED_MEAT)
    ) then
        if (player:getVar("ECOR_WAR_WIN-NMs_killed") == 1) then
            npcUtil.giveKeyItem(player, INDIGESTED_MEAT);
        elseif (
            not GetMobByID(WYRMFLY_OFFSET+0):isSpawned() and
            not GetMobByID(WYRMFLY_OFFSET+1):isSpawned() and
            not GetMobByID(WYRMFLY_OFFSET+2):isSpawned()
        ) then
            SpawnMob(WYRMFLY_OFFSET+0):updateClaim(player);
            SpawnMob(WYRMFLY_OFFSET+1):updateClaim(player);
            SpawnMob(WYRMFLY_OFFSET+2):updateClaim(player);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
