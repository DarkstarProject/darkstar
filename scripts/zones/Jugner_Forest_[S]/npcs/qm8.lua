-----------------------------------
--  Area: Jugner Forest (S)
--  NPC:  ???
--  Type: Quest NPC
--  @pos -6 0 -295
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        if (player:getVar("WrathOfTheGriffon") == 0) then
            player:startEvent(0x00CC);
        elseif (player:getVar("WrathOfTheGriffon") == 1) then
            if (player:needToZone() and player:getVar("CobraClawKilled") == 1) then
                player:startEvent(0x00CE);
            else
                player:startEvent(0x00CD);
            end
        end
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x00CC) then
        player:setVar("WrathOfTheGriffon",1);
    elseif (csid == 0x00CD) then
        SpawnMob(17113464,180):updateClaim(player);
    elseif (csid ==0x00CE) then
        player:setVar("WrathOfTheGriffon",2);
    end
    
end;
