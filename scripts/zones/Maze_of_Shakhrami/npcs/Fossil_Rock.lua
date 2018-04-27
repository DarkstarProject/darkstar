-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Fossil Rock
-- Used in Mission: Windurst Mission 2-1
-- !pos 17 18 184 198 + <many pos>
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/zones/Maze_of_Shakhrami/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - FOSSIL_ROCK_OFFSET;
    local windyMiss = player:getCurrentMission(WINDURST);
    local windyStat = player:getVar("MissionStatus");
    local randfoss = player:getVar("MissionStatus_randfoss");
    
    -- LOST FOR WORDS
    if (offset <= 6 and windyMiss == LOST_FOR_WORDS and (windyStat == 2 or windyStat == 3)) then
        if (randfoss == 0 or randfoss > 6) then -- account for values higher than 6 from defunct code
            randfoss = math.random(1,6);
            player:setVar("MissionStatus_randfoss", randfoss);
        end
        
        if ( (offset == 0 and randfoss == 1) or (offset > 1 and offset == randfoss) ) then -- clicked target stone
            if (player:hasKeyItem(dsp.kis.LAPIS_CORAL)) then
                player:messageSpecial(FOSSIL_EXTRACTED);
            else
                player:setVar("MissionStatus",3);
                npcUtil.giveKeyItem(player, dsp.kis.LAPIS_CORAL);
            end
        else
            player:messageSpecial(NOTHING_FOSSIL);
        end

    -- BLAST FROM THE PAST        
    elseif (offset == 8 and player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED) then
        if (not GetMobByID(ICHOROUS_IRE):isSpawned() and not player:hasItem(16511)) then
            SpawnMob(ICHOROUS_IRE):updateClaim(player);
        else
            player:messageSpecial(FOSSIL_EXTRACTED + 2); -- NM spawn point message.
        end
    
    -- DEFAULT DIALOG
    else
        player:messageSpecial(NOTHING_FOSSIL);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
