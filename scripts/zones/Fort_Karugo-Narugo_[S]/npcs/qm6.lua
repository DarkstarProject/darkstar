----------------------------------
--  Area: Fort Karugo Narugo [S]
--  NPC: ???
--  Type: Quest
--  @zone: 96
--  @pos -63 -75 4
--
-----------------------------------

package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
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
    
    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getVar("TigressStrikesProg") == 1) then
        player:startEvent(0x0066);
        elseif (player:getVar("TigressStrikesProg") == 2) then
            if (player:needToZone() and player:getVar("WarLynxKilled") == 1) then
                player:startEvent(0x0067);
            else
                SpawnMob(17170645,180):updateClaim(player);
            end
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0066) then
        player:setVar("TigressStrikesProg",2);
    elseif (csid == 0x0067) then
        player:setVar("TigressStrikesProg",3);
    end
end;

