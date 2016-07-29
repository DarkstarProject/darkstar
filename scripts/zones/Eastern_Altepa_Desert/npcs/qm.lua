-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  ???
-- Involved In Quest: A Craftsman's Work
-- @pos 113 -7.972 -72 114
-----------------------------------
package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Eastern_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    Decurio_I_IIIKilled = player:getVar("Decurio_I_IIIKilled");
    
    if (player:getVar("aCraftsmanWork") == 1 and Decurio_I_IIIKilled == 0) then
        SpawnMob(17244523,300):updateClaim(player);
    elseif (Decurio_I_IIIKilled == 1) then
        player:addKeyItem(ALTEPA_POLISHING_STONE);
        player:messageSpecial(KEYITEM_OBTAINED,ALTEPA_POLISHING_STONE);
        player:setVar("aCraftsmanWork",2);
        player:setVar("Decurio_I_IIIKilled",0);    
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