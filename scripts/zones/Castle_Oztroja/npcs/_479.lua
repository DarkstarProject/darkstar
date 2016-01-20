-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _479 (Brass Door)
-- Involved in Mission "Saintly Invitation"
-- @pos -99 -59 84 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs")
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1142,1) and trade:getItemCount() == 1) then -- check for Judgment Key
        if (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION and player:hasKeyItem(BALGA_CHAMPION_CERTIFICATE)) then
            if (player:getZPos() >= 80 and player:getZPos() < 86) then
                npc:openDoor(2.5);
                player:tradeComplete();
            else 
                player:messageSpecial(ITS_LOCKED);
            end
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        player:messageSpecial(ITS_LOCKED);
        return 1;
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;