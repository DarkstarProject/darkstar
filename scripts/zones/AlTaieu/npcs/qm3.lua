-----------------------------------
-- Area: Al'Taieu
-- NPC:  ??? (Jailer of Prudence Spawn)
-- Allows players to spawn the Jailer of Prudence by trading the Third Virtue, Deed of Sensibility, and High-Quality Hpemde Organ to a ???.
-- @pos , 706 -1 22 
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/mobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade the Third Virtue, Deed of Sensibility, and High-Quality Hpemde Organ
    if (GetMobAction(16912846) == 0 and GetMobAction(16912847) == 0 and trade:hasItemQty(1856,1) and trade:hasItemQty(1870,1) and 
    trade:hasItemQty(1871,1) and trade:getItemCount() == 3) then
        player:tradeComplete();
        SpawnMob(PrudenceOne,900):updateClaim(player); -- Spawn Jailer of Prudence 1
        SpawnMob(PrudenceTwo,900);                     -- Spawn Jailer of Prudence 2 unclaimed
    end
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
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
end;