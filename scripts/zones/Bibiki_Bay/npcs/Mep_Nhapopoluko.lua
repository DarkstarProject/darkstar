-----------------------------------
-- Area: Bibiki Bay
-- NPC:  Mep Nhapopoluko
-- Type: Guild Merchant NPC (Fishing Guild)
-- @pos 464.350 -6 752.731 4
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(519,1,18,5)) then
        player:showText(npc, MEP_NHAPOPOLUKO_DIALOG);
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

