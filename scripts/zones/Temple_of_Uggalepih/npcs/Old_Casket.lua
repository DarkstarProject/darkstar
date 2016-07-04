-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Old casket
-- Obtaining 'Paintbrush of Souls'
-- @pos 61 0 17 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(OLD_RUSTY_KEY)) then
        player:startEvent(0x0040,OLD_RUSTY_KEY);
    elseif (player:hasKeyItem(PAINTBRUSH_OF_SOULS)) then
        player:messageSpecial(NO_REASON_TO_INVESTIGATE);
    else
        player:messageSpecial(THE_BOX_IS_LOCKED);
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
    
    if (csid == 0x0040 and option == 1) then
        player:delKeyItem(OLD_RUSTY_KEY);
        player:addKeyItem(PAINTBRUSH_OF_SOULS);
        player:messageSpecial(KEYITEM_OBTAINED,PAINTBRUSH_OF_SOULS);
    end
    
end;