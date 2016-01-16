-----------------------------------
-- Area: Batallia Downs
--  NPC: qm1 (???)
--  @pos -407.526 -23.507 412.544 105
-- Notes: Spawns Vegnix Greenthumb for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Batallia_Downs/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Gob = GetMobAction(17207710);
    if ( (Gob == ACTION_NONE or Gob == ACTION_SPAWN) and (player:hasKeyItem(BOWL_OF_BLAND_GOBLIN_SALAD) == true) and (player:hasKeyItem(SEEDSPALL_ROSEUM) == false) and (player:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        SpawnMob(17207710,180):updateClaim(player);
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