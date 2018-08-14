-----------------------------------
--  Area: Tahrongi Canyon
--  NPC:  qm2 (???)
--  Note: Used to spawn Yara Ma Yha Who
-- !pos 271 0.001 -334 117
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Tahrongi_Canyon/TextIDs");
require("scripts/zones/Tahrongi_Canyon/MobIDs");
require("scripts/globals/settings");

function onTrade(player,npc,trade)
    -- Trade Distilled water to Spawn Yara Ma Yha Who
    if (not GetMobByID(YARA_MA_YHA_WHO):isSpawned() and trade:hasItemQty(4509,1) and trade:getItemCount() == 1) then
        if (GetServerVariable("[POP]Yara-Ma-Yha-Who-Timer") < os.time()) then -- Checks to make sure trade has not been made in past 50 minutes
            player:tradeComplete();
            local timesTraded = GetServerVariable("[POP]Yara-Ma-Yha-Who-Trades");
            if (timesTraded == 3) then -- Takes a minimum of 3 trades before NM can be spawned
                if (math.random(0,2) == 2) then
                    SpawnMob(YARA_MA_YHA_WHO):updateClaim(player);
                    player:messageSpecial(REPULSIVE_CREATURE_EMERGES);
                else
                    player:messageSpecial(SPROUT_LOOKING_BETTER);
                end
            else
                SetServerVariable("[POP]Yara-Ma-Yha-Who-Trades",timesTraded + 1)
                player:messageSpecial(SPROUT_LOOKING_BETTER);
            end
        else
            player:messageSpecial(SPROUT_DOES_NOT_NEED_WATER)
        end
        SetServerVariable("[POP]Yara-Ma-Yha-Who-Timer",os.time() + 3000); -- 50 minutes wait time before you can trade again
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onTrigger(player,npc)
    if (GetServerVariable("[POP]Yara-Ma-Yha-Who-Timer") < os.time()) then -- Checks to make sure trade has not been made in past 50 minutes
        player:messageSpecial(SPROUT_LOOKS_WITHERED);
    else
        player:messageSpecial(SPROUT_LOOKING_BETTER);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
