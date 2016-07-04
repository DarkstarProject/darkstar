-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  Sahagin Key Door
-- @zone 176
-- @pos 40 8.6 20.012
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1197,1) and trade:getItemCount() == 1) then
        npc:openDoor(8); --Open the door if a Sahagin key has been traded 
        player:messageSpecial(SAHAGIN_DOOR_TRADED,0,1197); -- Give a message telling the PC the item is lost
        player:tradeComplete();
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    X = player:getXPos();
    Z = player:getZPos();
    
    if (X > 94 and Z >= 40) then
        player:messageSpecial(SAHAGIN_DOOR_OUTSIDE); -- Give a message if standing on the "outside" of the door (closest to Norg)
    elseif (X < 104 and X >= 94 and Z <= 40) then
        player:messageSpecial(SAHAGIN_DOOR_INSIDE); -- Give a message if standing on the "inside" of the door
    end
    return 1 -- Keeps the door closed; it should not open onTrigger
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