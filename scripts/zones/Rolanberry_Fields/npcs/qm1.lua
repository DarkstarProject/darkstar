-----------------------------------
-- Area: Rolanberry Fields
--  NPC: qm1 (???)
--  @pos -686.216 -31.556 -369.723 110
-- Notes: Spawns Chuglix Berrypaws for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Rolanberry_Fields/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Gob = GetMobAction(17228249);
    if ( (Gob == ACTION_NONE or Gob == ACTION_SPAWN) and (player:hasKeyItem(JUG_OF_GREASY_GOBLIN_JUICE) == true) and (player:hasKeyItem(SEEDSPALL_CAERULUM) == false) and (player:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        SpawnMob(17228249,180):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;