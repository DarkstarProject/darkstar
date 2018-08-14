-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Oaken Box
-- Involved In Quest: Peace for the Spirit
-- !pos -164 0.1 225 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Garlaige_Citadel/TextIDs");
require("scripts/zones/Garlaige_Citadel/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 1094)) then -- Nail Puller
        player:startEvent(14);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("peaceForTheSpiritCS") == 4 and not player:hasItem(1094) and not GetMobByID(GUARDIAN_STATUE):isSpawned()) then -- Nail Puller
        player:messageSpecial(SENSE_OF_FOREBODING);
        SpawnMob(GUARDIAN_STATUE):updateClaim(player);
    else
        player:messageSpecial(YOU_FIND_NOTHING);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 14) then
        player:confirmTrade();
        player:setVar("peaceForTheSpiritCS", 5);
    end
end;
