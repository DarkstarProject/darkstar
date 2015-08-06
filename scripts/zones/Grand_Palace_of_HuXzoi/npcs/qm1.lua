-----------------------------------
--  Area: Grand Palace of Hu'Xzoi
--  NPC:  ???   (Ix'Aern - MNK)
--  @pos 460 0 540
--  ID: 16916819
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local IxAern = 16916815; -- Ix'Aern (MNK). This is the ID base for Ix and his minions. 
    local chance = 0; -- Rate in percent in which an item will drop.
    local validTrade = 0;
    -- Trade Organs
	if (GetMobAction(IxAern) == 0) then
        if (trade:hasItemQty(1900,1) and trade:getItemCount() == 1) then -- 1 HQ Aern Organ (33%)
            chance=33;
            validTrade=1;
        elseif (trade:hasItemQty(1900,2) and trade:getItemCount() == 2) then -- 2 HQ Aern Organ (66%)
            chance=66;
            validTrade=2;
        elseif (trade:hasItemQty(1900,3) and trade:getItemCount() == 3) then -- 3 HQ Aern Organ (100%)
            chance=100;
            validTrade=3;
        end;
    end;
    
    if (validTrade > 0) then -- Don't want to take their random shit
        player:tradeComplete(); -- Take the items
        npc:setLocalVar("[SEA]IxAern_DropRate", chance); -- Used to adjust droprates for IxAern's onMobSpawn.
        GetMobByID(IxAern):setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos());
        SpawnMob(IxAern,300):updateClaim(player);
        
        -- Minions
        if (validTrade > 1) then
            GetMobByID(IxAern+1):setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos()-4);
            SpawnMob(IxAern+1,300):updateClaim(player);
        end
        if (validTrade > 2) then
            GetMobByID(IxAern+2):setSpawn(npc:getXPos(), npc:getYPos(), npc:getZPos()+4);
            SpawnMob(IxAern+2,300):updateClaim(player);
        end
        
        npc:hideNPC(900); -- 15 minute respawn timer
         -- Change the location to G-7 or I-7
        if (math.random(0,1) ==1) then
            npc:setPos(380,0,540,0); -- G-7
        else
            npc:setPos(460,0,540,0); -- I-7
        end;
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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