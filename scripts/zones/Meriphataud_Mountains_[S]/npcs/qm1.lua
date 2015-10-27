-----------------------------------
-- Area: Meriphataud Mountains [S] 
-- NPC:  ???
-- @pos 757 -16 -446
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(2566,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17174889,1800):updateClaim(player); -- Bloodlapper
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    
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
end;