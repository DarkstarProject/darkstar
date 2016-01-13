-----------------------------------
-- Area: Heaven's Tower
--  NPC: Starway Stairway
-- @pos -10 0.1 30 242
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/Heavens_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getNation() == 2) then
        if (player:hasKeyItem(STARWAY_STAIRWAY_BAUBLE)) then
            if (player:getXPos() < -14) then
                player:startEvent(0x006A);
            else
                player:startEvent(0x0069);
            end;
        else
          player:messageSpecial(text.STAIRWAY_LOCKED);
        end;
    else
        player:messageSpecial(text.STAIRWAY_ONLY_CITIZENS);
    end
    
    return 1;

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