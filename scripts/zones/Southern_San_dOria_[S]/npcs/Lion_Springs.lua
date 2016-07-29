-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Door:Lion Springs
-- @zone 80
-- @pos 96 0 106
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(WOTG) == THE_QUEEN_OF_THE_DANCE) then
        if (player:getVar("QueenOfTheDance") == 0) then
            player:startEvent(0x0044);
        elseif (player:getVar("QueenOfTheDance") == 2) then
            player:startEvent(0x0046);
        end
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
    if (csid == 0x0044) then
        player:setVar("QueenOfTheDance",1);
    elseif (csid == 0x0046) then
        player:startEvent(0x0098);
    elseif (csid == 0x0098) then
        player:startEvent(0x0099);
    elseif (csid == 0x0099) then
        player:completeMission(WOTG, THE_QUEEN_OF_THE_DANCE);
        player:addMission(WOTG, WHILE_THE_CAT_IS_AWAY);
        player:delKeyItem(MAYAKOV_SHOW_TICKET);
        player:setVar("QueenOfTheDance",0);
    end
end;