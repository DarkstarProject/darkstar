-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Cavernous Maw
-- @pos -198 8 360 91
-- Teleports Players to Rolanberry Fields
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Rolanberry_Fields_[S]/TextIDs");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and
        (player:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, FIRES_OF_DISCONTENT) == QUEST_COMPLETED)) then
        player:startEvent(701);
    elseif (hasMawActivated(player,1) == false) then
        player:startEvent(101);
    else
        player:startEvent(102);
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
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (csid == 101 and option == 1) then
        player:addNationTeleport(MAW,2);
        toMaw(player,4);
    elseif (csid == 102 and option == 1) then
        toMaw(player,4);
    elseif (csid == 701) then
        player:completeMission(WOTG, BACK_TO_THE_BEGINNING);
        player:addMission(WOTG, CAIT_SITH);
        player:addTitle(CAIT_SITHS_ASSISTANT);
        if (hasMawActivated(player,0) == false) then
            player:addNationTeleport(MAW,2);
        end
        toMaw(player,4);		
    end
end;