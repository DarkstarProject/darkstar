-----------------------------------
-- Area: Maze of Shakhrami
-- Quest: Corsair Af1 "Equiped for All Occasions"
--  NPC: Iron Door (Spawn Lost Soul)
-- !pos 247.735 18.499 -142.267 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/zones/Maze_of_Shakhrami/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local efao = player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS);
    local efaoStat = player:getVar("EquipedforAllOccasions");
    
    if (efao == QUEST_ACCEPTED and efaoStat == 1 and not GetMobByID():isSpawned(LOST_SOUL)) then
        SpawnMob(LOST_SOUL):updateClaim(player);
    elseif (efao == QUEST_ACCEPTED and efaoStat == 2) then
        player:startEvent(66)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 66) then
        npcUtil.giveKeyItem(player, WHEEL_LOCK_TRIGGER);
        player:setVar("EquipedforAllOccasions",3);
    end
end;
