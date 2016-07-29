-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  Silver Beastcoin Door
-- @zone 176
-- @pos 280 18.549 -100
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(750,1) and trade:getItemCount() == 1) then
        if (player:getVar("SSG_SilverDoor") == 7) then
        npc:openDoor(5) --Open the door if a silver beastcoin has been traded after checking the door the required number of times
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    X = player:getXPos();
    Z = player:getZPos();
    SilverDoorCheck = player:getVar("SSG_SilverDoor");
    
    if (X <= 280  and Z >= -104) then 
        if (SilverDoorCheck == 0) then --Door has never been checked
            player:messageSpecial(FIRST_CHECK);
            player:setVar("SSG_SilverDoor",1);
        elseif (SilverDoorCheck == 1) then --Door has been checked once
            player:messageSpecial(SECOND_CHECK);
            player:setVar("SSG_SilverDoor",2);
        elseif (SilverDoorCheck == 2) then --Door has been checked twice
            player:messageSpecial(THIRD_CHECK);
            player:setVar("SSG_SilverDoor",3);
        elseif (SilverDoorCheck == 3) then --Door has been checked three times
            player:messageSpecial(FOURTH_CHECK);
            player:setVar("SSG_SilverDoor",4);
        elseif (SilverDoorCheck == 4) then --Door has been checked four times
            player:messageSpecial(FIFTH_CHECK);
            player:setVar("SSG_SilverDoor",5);
        elseif (SilverDoorCheck == 5) then --Door has been checked five times
            player:messageSpecial(SILVER_CHECK);
            player:setVar("SSG_SilverDoor",6);
        elseif (SilverDoorCheck == 6 or SilverDoorCheck == 7) then --Door has been checked six or more times
            player:messageSpecial(COMPLETED_CHECK,750);
            player:setVar("SSG_SilverDoor",7);
        end
    return 1 --Keep the door closed
    elseif (X > 280 and Z < -100) then
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