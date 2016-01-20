-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  ??? (qm1)
--  @pos -402.574 3.999 -202.750 7
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Attohwa_Chasm/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
-- Antlion Trap: ID 1825
-- Alastor Antlion: ID 16806248
-- UPDATE `mob_spawn_points` SET `pos_x`='-402.574', `pos_y`='3.999', `pos_z`='-202.75', `pos_rot`='7' WHERE (`mobid`='16806242')
    local feelerID =16806242;
    local feelerAntlion = GetMobByID(feelerID);
    local npcX    = npc:getXPos();
    local npcY    = npc:getYPos();
    local npcZ    = npc:getZPos();
    
    feelerAntlion:setSpawn(npcX-3,npcY-2,npcZ-1);

    if (GetMobAction(feelerID) == 0 and trade:hasItemQty(1825,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();        
        SpawnMob(feelerID,120):updateClaim(player);
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(OCCASIONAL_LUMPS);
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