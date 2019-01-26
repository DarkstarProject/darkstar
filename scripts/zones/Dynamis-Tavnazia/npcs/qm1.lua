-----------------------------------
-- Area: Dynamis-Tavnazia
--  NPC: ???
-- !pos
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/dynamis");
local ID = require("scripts/zones/Dynamis-Tavnazia/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (GetServerVariable("[DynaTavnazia]Boss_Trigger")== 0 and trade:getItemCount() == 1  and trade:hasItemQty(3459,1) ) then

        local npcX = npc:getXPos();
        local npcY = npc:getYPos();
        local npcZ = npc:getZPos();

        local DiabolosID = TavnaziaDiabolosList[math.random(1,4)];

            local ShortID = GetMobByID(DiabolosID):getShortID()
                        SpawnMob(DiabolosID):updateClaim(player);
                        GetMobByID(DiabolosID):setMobMod(dsp.mobMod.SUPERLINK,ShortID);
                        GetMobByID(DiabolosID):setPos(npcX-1,npcY-2,npcZ-1);
                        GetMobByID(DiabolosID):setSpawn(npcX-1,npcY-2,npcZ-1);
    -- printf("DiabolosID: %u",DiabolosID);


            if (DiabolosID == 16949252) then -- diabolos smn
                SpawnMob(16949253):setMobMod(dsp.mobMod.SUPERLINK, ShortID);
                        GetMobByID(16949253):setPos(npcX-1,npcY-2,npcZ-1);
                        GetMobByID(16949253):setSpawn(npcX-1,npcY-2,npcZ-1);
                SpawnMob(16949254):setMobMod(dsp.mobMod.SUPERLINK, ShortID);
                        GetMobByID(16949254):setPos(npcX-3,npcY-2,npcZ-1);
                        GetMobByID(16949254):setSpawn(npcX+3,npcY-2,npcZ-1);
            end

        SetServerVariable("[DynaTavnazia]Boss_Trigger",1);
        player:tradeComplete();
    end
end;

function onTrigger(player,npc)
     player:messageSpecial(ID.text.DIABOLOS,3459);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

end;