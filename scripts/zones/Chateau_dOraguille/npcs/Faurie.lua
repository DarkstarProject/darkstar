-----------------------------------
-- Area: Chateau d'Oraguille
--     Faurie
--     Chat Text and Zone Exit Menu
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
    player:startEvent(0x01FA);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
    if (option == 0) then
      player:setPos(0, 0, 100, 64, 0xe7);
    end;
end;
