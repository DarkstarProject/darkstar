-----------------------------------
-- Area: Hall of the Gods
-- NPC:  Shimmering Circle
-- Lifts players up to the sky!
-- @pos 0 -20 147 251
-----------------------------------
package.loaded["scripts/zones/Hall_of_the_Gods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Hall_of_the_Gods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   local ZilartProgress = player:getCurrentMission(ZILART);
   local ZVar = player:getVar("ZilartStatus");

    if (player:getZPos() < 200) then
        if (ZilartProgress == THE_GATE_OF_THE_GODS and ZVar == 0) then
            player:startEvent(0x0003); -- First time.
        elseif (ZilartProgress ~= 255 and ZilartProgress > THE_GATE_OF_THE_GODS or -- If player has not done any ZM, Progress == 255
         (ZilartProgress == THE_GATE_OF_THE_GODS and ZVar > 0)) then
            player:startEvent(0x000a);
      else
         player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        end
    else
        player:startEvent(0x000b);
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
    
    if (csid == 0x0003) then
        player:setVar("ZilartStatus",1);
    end
    
end;