-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Moogle
-- @zone 80
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/moghouse")

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    moogleTrade(player,npc,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (not moogleTrigger(player,npc)) then
        player:startEvent(0x003D);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x7530) then
        player:setVar("MoghouseExplication",0);
    end
end;