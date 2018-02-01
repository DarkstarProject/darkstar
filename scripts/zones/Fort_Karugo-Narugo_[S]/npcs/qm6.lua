----------------------------------
-- Area: Fort Karugo Narugo [S]
--  NPC: ???
-- Type: Quest
--  @zone 96
-- !pos -63 -75 4
--
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getVar("TigressStrikesProg") == 1) then
        player:startEvent(102);
        elseif (player:getVar("TigressStrikesProg") == 2) then
            if (player:needToZone() and player:getVar("WarLynxKilled") == 1) then
                player:startEvent(103);
            else
                SpawnMob(17170645):updateClaim(player);
            end
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);

    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 102) then
        player:setVar("TigressStrikesProg",2);
    elseif (csid == 103) then
        player:setVar("TigressStrikesProg",3);
    end
end;

