-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Tonberry Rattle ITEM)
-- @pos 269 0 91 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    respawn = GetServerVariable("[TEMP]Respawn_qm1_for_rattle");
    
    if (player:hasItem(1266) == false and player:getFreeSlotsCount() >= 1 and respawn <= os.time(t)) then
        player:addItem(1266);
        player:messageSpecial(ITEM_OBTAINED,1266); -- Uggalepih Rattle
        SetServerVariable("[TEMP]Respawn_qm1_for_rattle",os.time(t) + 7200); -- 2 hours
        -- ??? dissapears for 2 hours and reappears on new position
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
    
end;