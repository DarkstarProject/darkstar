-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: Cavernous Maw
-- Teleports Players to East Ronfaure
-- @pos 322 -59 503 81
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/East_Ronfaure_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (hasMawActivated(player,6) == false) then
        player:startEvent(0x0064);
    else
        player:startEvent(0x0065);
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
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (option == 1) then
        if (csid == 0x0064) then
            player:addNationTeleport(MAW,64);
        end
        toMaw(player,10);
    end
end;