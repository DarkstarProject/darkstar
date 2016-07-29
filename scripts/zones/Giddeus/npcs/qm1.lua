-----------------------------------
-- Area: Giddeus
-- NPC:  ???
-- Involved In Quest: Dark Legacy
-- @zone 145
-- @pos -58 0 -449
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    darkLegacyCS = player:getVar("darkLegacyCS");
    
    if (darkLegacyCS == 3 or darkLegacyCS == 4) then
        if (trade:hasItemQty(4445,1) and trade:getItemCount() == 1) then -- Trade Yagudo Cherries
            player:tradeComplete();
            player:messageSpecial(SENSE_OF_FOREBODING);
            SpawnMob(17371579,180):updateClaim(player);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("darkLegacyCS") == 5 and player:hasKeyItem(DARKSTEEL_FORMULA) == false) then
        player:addKeyItem(DARKSTEEL_FORMULA);
        player:messageSpecial(KEYITEM_OBTAINED,DARKSTEEL_FORMULA);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;