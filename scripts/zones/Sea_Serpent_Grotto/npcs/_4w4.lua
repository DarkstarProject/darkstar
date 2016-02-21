-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  Gold Beastcoin Door
-- @zone 176
-- @pos 60 8.55 -80
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(748,1) and trade:getItemCount() == 1) then
        if (player:getVar("SSG_GoldDoor") == 7) then
        npc:openDoor(5) --Open the door if a gold beastcoin has been traded after checking the door the required number of times
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    X = player:getXPos();
    Z = player:getZPos();
    GoldDoorCheck = player:getVar("SSG_GoldDoor");
    
    if (X >= 55  and Z >= -80) then 
        if (GoldDoorCheck == 0) then --Door has never been checked
            player:messageSpecial(FIRST_CHECK);
            player:setVar("SSG_GoldDoor",1);
        elseif (GoldDoorCheck == 1) then --Door has been checked once
            player:messageSpecial(SECOND_CHECK);
            player:setVar("SSG_GoldDoor",2);
        elseif (GoldDoorCheck == 2) then --Door has been checked twice
            player:messageSpecial(THIRD_CHECK);
            player:setVar("SSG_GoldDoor",3);
        elseif (GoldDoorCheck == 3) then --Door has been checked three times
            player:messageSpecial(FOURTH_CHECK);
            player:setVar("SSG_GoldDoor",4);
        elseif (GoldDoorCheck == 4) then --Door has been checked four times
            player:messageSpecial(FIFTH_CHECK);
            player:setVar("SSG_GoldDoor",5);
        elseif (GoldDoorCheck == 5) then --Door has been checked five times
            player:messageSpecial(GOLD_CHECK);
            player:setVar("SSG_GoldDoor",6);
        elseif (GoldDoorCheck == 6 or GoldDoorCheck == 7) then --Door has been checked six or more times
            player:messageSpecial(COMPLETED_CHECK,748);
            player:setVar("SSG_GoldDoor",7);
        end
    return 1 --Keep the door closed
    elseif (X > 55 and Z < -81) then
    return -1 --Open the door if coming from the "inside"
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