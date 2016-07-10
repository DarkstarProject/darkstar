-----------------------------------
--  Area: Western Adoulin
--  NPC: Kipligg
--  Type: Standard NPC and Mission NPC,
--  Involved with Missions: '...Into the Fire'
--                          'Done and Delivered'
--  @zone 256
--  @pos -32 0 22 256
-----------------------------------
require("scripts/globals/missions");

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

    if (SOA_Mission < LIFE_ON_THE_FRONTIER) then
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x023B);
    elseif (SOA_Mission == INTO_THE_FIRE) then
        -- Finishes SOA Mission: '...Into the Fire'
        player:startEvent(0x009B);
    elseif ((SOA_Mission >= MELVIEN_DE_MALECROIX) and (SOA_Mission <= COURIER_CATASTROPHE)) then
        -- Reminds player where to go for SOA Mission: 'Melvien de Malecroix'
        player:startEvent(0x00A2);
    elseif (SOA_Mission == DONE_AND_DELIVERED) then
        -- Finishes SOA Mission: 'Done and Delivered'
        player:startEvent(0x009D);
    elseif (SOA_Mission == MINISTERIAL_WHISPERS) then
        -- Reminds player where to go for SOA Mission: 'Ministerial Whispers'
        player:startEvent(0x00A3);
    else
        -- Dialogue after joining colonization effort
        player:startEvent(0x024D);
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
    if (csid == 0x009B) then
        -- Finishes SOA Mission: '...Into the Fire'
        player:completeMission(SOA, INTO_THE_FIRE);
        player:addMission(SOA, MELVIEN_DE_MALECROIX);
    elseif (csid == 0x009D) then
        -- Finishes SOA Mission: 'Done and Delivered'
        player:completeMission(SOA, DONE_AND_DELIVERED);
        player:addMission(SOA, MINISTERIAL_WHISPERS);
    end
end;
