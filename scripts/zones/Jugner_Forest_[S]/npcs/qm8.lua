-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: ???
-- Type: Quest NPC
-- !pos -6 0 -295
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        if (player:getVar("WrathOfTheGriffon") == 0) then
            player:startEvent(204);
        elseif (player:getVar("WrathOfTheGriffon") == 1) then
            if (player:needToZone() and player:getVar("CobraClawKilled") == 1) then
                player:startEvent(206);
            else
                player:startEvent(205);
            end
        end
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 204) then
        player:setVar("WrathOfTheGriffon",1);
    elseif (csid == 205) then
        SpawnMob(17113464):updateClaim(player);
    elseif (csid ==206) then
        player:setVar("WrathOfTheGriffon",2);
    end

end;
