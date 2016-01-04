-----------------------------------
-- Area:  Pso'Xja
-- NPC:   _091 (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- @pos 350.000 -1.925 -61.600 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

    if ((trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1 and player:getMainJob() == 6) then

        local Z=player:getZPos();
    
        if (npc:getAnimation() == 9) then    
            if (Z >= -61) then
                if (GetMobAction(16814082) == 0) then
                    local Rand = math.random(1,2); -- estimated 50% success as per the wiki
                    if (Rand == 1) then -- Spawn Gargoyle
                        player:messageSpecial(DISCOVER_DISARM_FAIL + 0x8000, 0, 0, 0, 0, true); 
                        SpawnMob(16814082,120):updateClaim(player); -- Gargoyle
                    else
                        player:messageSpecial(DISCOVER_DISARM_SUCCESS + 0x8000, 0, 0, 0, 0, true);
                        npc:openDoor(30);
                    end
                    player:tradeComplete();
                else
                    player:messageSpecial(DOOR_LOCKED);
                end
            end
        end
    end

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 

    local Z=player:getZPos();
    
    if (npc:getAnimation() == 9) then    
        if (Z >= -61) then
            if (GetMobAction(16814082) == 0) then
                local Rand = math.random(1,10);
                if (Rand <=9) then -- Spawn Gargoyle
                    player:messageSpecial(TRAP_ACTIVATED + 0x8000, 0, 0, 0, 0, true); 
                    SpawnMob(16814082,120):updateClaim(player); -- Gargoyle
                else
                    player:messageSpecial(TRAP_FAILS + 0x8000, 0, 0, 0, 0, true);
                    npc:openDoor(30);
                end    
            else
                player:messageSpecial(DOOR_LOCKED);
            end    
        elseif (Z <= -62) then
            player:startEvent(0x001A);
        end
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
    if (csid == 0x001A and option == 1) then
        player:setPos(260,-0.25,-20,254,111);
    end
end;