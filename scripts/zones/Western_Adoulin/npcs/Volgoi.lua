-----------------------------------
--  Area: Western Adoulin
--  NPC: Volgoi
--  Type: Standard NPC
--  @zone 256
-- @pos -154 4 -22
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
    if ((SOA_Mission >= BEAUTY_AND_THE_BEAST) and (SOA_Mission <= SALVATION)) then
        -- Speech while Arciela is 'kidnapped'
        player:startEvent(0x0097);
    else
        -- Standard dialogue
        player:startEvent(0x01F5);
        -- Volgoi also has 0x0243 associated with him, but it's the exact same dialogue
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
end;
