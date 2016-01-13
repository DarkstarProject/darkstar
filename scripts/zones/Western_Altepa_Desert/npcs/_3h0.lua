-----------------------------------
-- Area: Western Altepa Desert
--  NPC: _3h0 (Altepa Gate)
-- @pos -19 12 131 125
-----------------------------------

local text = require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        if (player:getZPos() > 137) then
            npc:openDoor(3.2);
        else
            player:messageSpecial(text.THE_DOOR_IS_LOCKED);
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
end;