-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: ???
-- Type: Quest NPC
-- !pos -6 0 -295 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/zones/Jugner_Forest_[S]/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local wotg = player:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON);
    local wotgStat = player:getVar("WrathOfTheGriffon");
    
    if (wotg == QUEST_ACCEPTED and wotgStat == 0) then
        player:startEvent(204);
    elseif (player:getVar("CobraClawKilled") == 1) then
        player:startEvent(206);
    elseif (player:getVar("WrathOfTheGriffon") == 1 and not GetMobByID(COBRACLAW_BUCHZVOTCH):isSpawned()) then
        player:startEvent(205);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 204) then
        player:setVar("WrathOfTheGriffon",1);
    elseif (csid == 205) then
        SpawnMob(COBRACLAW_BUCHZVOTCH):updateClaim(player);
    elseif (csid == 206) then
        player:setVar("CobraClawKilled", 0);
        player:setVar("WrathOfTheGriffon", 2);
    end
end;
