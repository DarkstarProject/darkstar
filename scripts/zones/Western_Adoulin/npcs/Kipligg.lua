-----------------------------------
--  Area: Western Adoulin
--  NPC: Kipligg
--  Type: Standard NPC and Mission NPC,
--  Involved with Missions: '...Into the Fire'
--                          'Done and Delivered'
--  @zone 256
--  !pos -32 0 22 256
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
        player:startEvent(571);
    elseif (SOA_Mission == INTO_THE_FIRE) then
        -- Finishes SOA Mission: '...Into the Fire'
        player:startEvent(155);
    elseif ((SOA_Mission >= MELVIEN_DE_MALECROIX) and (SOA_Mission <= COURIER_CATASTROPHE)) then
        -- Reminds player where to go for SOA Mission: 'Melvien de Malecroix'
        player:startEvent(162);
    elseif (SOA_Mission == DONE_AND_DELIVERED) then
        -- Finishes SOA Mission: 'Done and Delivered'
        player:startEvent(157);
    elseif (SOA_Mission == MINISTERIAL_WHISPERS) then
        -- Reminds player where to go for SOA Mission: 'Ministerial Whispers'
        player:startEvent(163);
    else
        -- Dialogue after joining colonization effort
        player:startEvent(589);
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
    if (csid == 155) then
        -- Finishes SOA Mission: '...Into the Fire'
        player:completeMission(SOA, INTO_THE_FIRE);
        player:addMission(SOA, MELVIEN_DE_MALECROIX);
    elseif (csid == 157) then
        -- Finishes SOA Mission: 'Done and Delivered'
        player:completeMission(SOA, DONE_AND_DELIVERED);
        player:addMission(SOA, MINISTERIAL_WHISPERS);
    end
end;
