-----------------------------------
--  Area: Western Adoulin
--  NPC: Dangueubert
--  Type: Standard NPC and Quest NPC
--  Involved with Quest: 'A Certain Substitute Patrolman'
--  @zone 256
--  @pos 5 0 -136 256
-----------------------------------
require("scripts/globals/missions");
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
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((ACSP == QUEST_ACCEPTED) and (player:getVar("ACSP_NPCs_Visited") == 6)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(0x09FE);
        else
            -- Standard dialogue
            player:startEvent(0x0222, 0, 1);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x0222);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x09FE) then
        -- Progresses Quest: 'A Certain Substitute Patrolman'
        player:setVar("ACSP_NPCs_Visited", 7);
    elseif (csid == 0x0222) then
        if (option == 1) then
            -- Warps player to Mog Garden
            player:setPos(0, 0, 0, 0, 280);
        end
    end
end;
