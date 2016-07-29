-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Cavernous Maw
-- @pos 0 0 -165 95
-- Teleports Players to West Sarutabaruta
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (hasMawActivated(player,8) == false) then
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (option == 1) then
        if (csid == 0x0064) then
            player:addNationTeleport(MAW,256);
        end
        toMaw(player,8);
    end
end;