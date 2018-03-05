-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Granite Door
-- Involved in Missions: San dOria Mission 8-2
-- !pos -50 -17 -154
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 5) then
        if (player:hasKeyItem(PIECE_OF_A_BROKEN_KEY1) and player:hasKeyItem(PIECE_OF_A_BROKEN_KEY2)
            and player:hasKeyItem(PIECE_OF_A_BROKEN_KEY3) and not GetMobByID(NIO_A):isSpawned()
            and not GetMobByID(NIO_HUM):isSpawned()) then
            if (player:getVar("Mission8-2Kills") > 0) then
                player:startEvent(65);
            else
                SpawnMob(NIO_A);
                SpawnMob(NIO_HUM);
            end
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 65) then
        player:setVar("Mission8-2Kills",0);
        player:setVar("MissionStatus",6);
    end
end;
