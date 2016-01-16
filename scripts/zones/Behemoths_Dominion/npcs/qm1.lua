-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  ???
-- Involved In Quest: The Talekeeper's Gift
-- @pos 211 4 -79 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Behemoths_Dominion/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("theTalekeeperGiftCS") == 3 and player:getVar("theTalekeepersGiftKilledNM") < 3) then
        player:messageSpecial(SENSE_OF_FOREBODING);
        SpawnMob(17297446,180):updateClaim(player);
        SpawnMob(17297447,180):updateClaim(player);
        SpawnMob(17297448,180):updateClaim(player);
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