-----------------------------------
-- Area: North Gustaberg [S]
--  NPC: Cavernous Maw
-- @pos 466 0 479 88
-- Teleports Players to North Gustaberg
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (hasMawActivated(player,7) == false) then
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
            player:addNationTeleport(MAW,128);
        end
        toMaw(player,12);
    end
end;