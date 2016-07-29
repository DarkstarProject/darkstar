-----------------------------------
-- Area: Xarcabard
-- NPC:  qm7 (???)
-- Involved in Quests: RNG AF3 quest - Unbridled Passion
-- @pos -295.065 -25.054 151.250 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
local koenigsTiger = 17236205;

function onTrigger(player,npc)

    local UnbridledPassionCS = player:getVar("unbridledPassion");	
    local tigerAction = GetMobAction(koenigsTiger);

    if (UnbridledPassionCS == 4 and tigerAction == 0) then -- prevent repeated playback while the tiger is already up and fighting
        player:startEvent(0x0008);
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

    if (csid == 0x0008) then
        SpawnMob(koenigsTiger,240):updateClaim(player);
    end

end;