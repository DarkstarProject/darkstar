-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ??? (qm6)
-- Bastok Mission 8.1 "The Chains That Bind Us"
-- !pos -469 0 620 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
package.loaded["scripts/zones/Quicksand_Caves/MobIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- THE CHAINS THAT BIND US
    if (player:getCurrentMission(player:getNation()) == THE_CHAINS_THAT_BIND_US and player:getVar("MissionStatus") == 1) then
        if (os.time() >= npc:getLocalVar("cooldown")) then
            if (GetMobByID(CENTURIO_IV_VII):isSpawned() or GetMobByID(TRIARIUS_IV_XIV):isSpawned() or GetMobByID(PRINCEPS_IV_XLV):isSpawned()) then
                player:messageSpecial(NOW_IS_NOT_THE_TIME);
            else
                player:messageSpecial(SENSE_OF_FOREBODING);
                SpawnMob(CENTURIO_IV_VII):updateClaim(player);
                SpawnMob(TRIARIUS_IV_XIV):updateClaim(player);
                SpawnMob(PRINCEPS_IV_XLV):updateClaim(player);
            end
        else
            player:startEvent(11);
        end

    -- DEFAULT DIALOG        
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- THE CHAINS THAT BIND US
    if (csid == 11) then
        player:setVar("MissionStatus", 2);
    end
end;
