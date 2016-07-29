-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Cavernous Maw
-- @pos 597 -32 279 97
-- Teleports Players to Meriphataud Mountains
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (hasMawActivated(player,5) == false) then
        player:startEvent(0x0066);
    else
        player:startEvent(0x0067);
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (option == 1) then
        if (csid == 0x0066) then
            player:addNationTeleport(MAW,32);
        end
        toMaw(player,18);
    end
end;