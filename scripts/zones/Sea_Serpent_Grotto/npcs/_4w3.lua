-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  Mythril Beastcoin Door
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
    
    if (trade:hasItemQty(749,1) and trade:getItemCount() == 1) then
        if (player:getVar("SSG_MythrilDoor") == 7) then
        npc:openDoor(5) --Open the door if a mythril beastcoin has been traded after checking the door the required number of times
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    X = player:getXPos();
    Z = player:getZPos();
    MythrilDoorCheck = player:getVar("SSG_MythrilDoor");
    
    if (X >= 40  and Z >= 15) then 
        if (MythrilDoorCheck == 0) then --Door has never been checked
            player:messageSpecial(FIRST_CHECK);
            player:setVar("SSG_MythrilDoor",1);
        elseif (MythrilDoorCheck == 1) then --Door has been checked once
            player:messageSpecial(SECOND_CHECK);
            player:setVar("SSG_MythrilDoor",2);
        elseif (MythrilDoorCheck == 2) then --Door has been checked twice
            player:messageSpecial(THIRD_CHECK);
            player:setVar("SSG_MythrilDoor",3);
        elseif (MythrilDoorCheck == 3) then --Door has been checked three times
            player:messageSpecial(FOURTH_CHECK);
            player:setVar("SSG_MythrilDoor",4);
        elseif (MythrilDoorCheck == 4) then --Door has been checked four times
            player:messageSpecial(FIFTH_CHECK);
            player:setVar("SSG_MythrilDoor",5);
        elseif (MythrilDoorCheck == 5) then --Door has been checked five times
            player:messageSpecial(MYTHRIL_CHECK);
            player:setVar("SSG_MythrilDoor",6);
        elseif (MythrilDoorCheck == 6 or MythrilDoorCheck == 7) then --Door has been checked six or more times
            player:messageSpecial(COMPLETED_CHECK,749);
            player:setVar("SSG_MythrilDoor",7);
        end
    return 1 --Keep the door closed
    elseif (X < 40 and Z < 24) then
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