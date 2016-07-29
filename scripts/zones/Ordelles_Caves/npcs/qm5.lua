-----------------------------------
-- Area: Ordelles Caves
-- NPC:  ??? (qm5)
-- Involved In Quest: Dark Puppet
-- @pos -92 -28 -70 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Ordelles_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getVar("darkPuppetCS") >= 3 and player:hasItem(16940) == false) then
        if (trade:hasItemQty(16681,1) and trade:getItemCount() == 1) then -- Trade Gerwitz's Axe
            player:tradeComplete();
            player:messageSpecial(GERWITZS_SWORD_DIALOG);
            SpawnMob(17568136,180):updateClaim(player);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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