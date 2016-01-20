-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm1 (???)
--  @pos 203.939 0.000 -238.811 120
-- Notes: Spawns Dribblix Greasemaw for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Gob = GetMobAction(17269114);
    if ( (Gob == ACTION_NONE or Gob == ACTION_SPAWN) and (player:hasKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB) == true) and (player:hasKeyItem(SEEDSPALL_VIRIDIS) == false) and (player:hasKeyItem(VIRIDIAN_KEY) == false) ) then
        SpawnMob(17269114,180):updateClaim(player);
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